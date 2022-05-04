package csc369;

import java.io.IOException;
import java.util.Iterator;
import java.util.StringTokenizer;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

public class SortTextNum {

    public static final Class OUTPUT_KEY_CLASS = IntWritable.class;
    public static final Class OUTPUT_VALUE_CLASS = Text.class;

    public static class MapperImpl extends Mapper<LongWritable, Text, IntWritable, Text> {
	private final IntWritable one = new IntWritable(1);

        // @Override
	protected void map(LongWritable key, Text value,
			   Context context) throws IOException, InterruptedException {
	    

        String line = value.toString();
        StringTokenizer tokenizer = new StringTokenizer(line);
	    Text key1 = new Text();
	    key1.set(tokenizer.nextToken());
        IntWritable val = new IntWritable(Integer.parseInt(tokenizer.nextToken()));
	    context.write(val, key1);
        }
    }
}

    