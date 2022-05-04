package csc369;

import java.io.IOException;
import java.text.*;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.text.SimpleDateFormat;
import java.util.Date;  
import java.text.DateFormat;  

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

public class BytesSent {

    public static final Class OUTPUT_KEY_CLASS = Text.class;
    public static final Class OUTPUT_VALUE_CLASS = IntWritable.class;

    public static class MapperImpl extends Mapper<LongWritable, Text, Text, IntWritable> {
	private final IntWritable one = new IntWritable(1);

        @Override
	protected void map(LongWritable key, Text value,
			   Context context) throws IOException, InterruptedException {
	    String[] sa = value.toString().split(" ");
	    Text year = new Text();
	    
        String dt = sa[3];
        dt = dt.replace("[", "");

        try {
           
            SimpleDateFormat DateFormat = new SimpleDateFormat("dd/MMM/yyyy:hh:mm:ss");
            Date MonthYear = DateFormat.parse(dt);
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            String strDate = dateFormat.format(MonthYear);  
        
            year.set(strDate);
            context.write(year, one);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        }
    }

    public static class ReducerImpl extends Reducer<Text, IntWritable, Text, IntWritable> {
	private IntWritable result = new IntWritable();
    
        @Override
	protected void reduce(Text hostname, Iterable<IntWritable> intOne,
			      Context context) throws IOException, InterruptedException {
            int sum = 0;
            Iterator<IntWritable> itr = intOne.iterator();
        
            while (itr.hasNext()){
                sum  += itr.next().get();
            }
            result.set(sum);
            try {
                String dt = hostname.toString();
                SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date MonthYear = DateFormat.parse(dt);
                DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
                String strDate = dateFormat.format(MonthYear);  
                Text yearMonth = new Text();
                yearMonth.set(strDate);
                context.write(yearMonth, result);
 
            } catch (ParseException e) {
                e.printStackTrace();
            }
       }
    }

}
