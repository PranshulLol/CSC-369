package csc369;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class HadoopApp {

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {
        Configuration conf = new Configuration();
        Job job = new Job(conf, "Hadoop example");
		
		Configuration conf1 = new Configuration();
		Job job1 = new Job(conf1, "Hadoop example1");
        
		String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();

	if (otherArgs.length < 3) {
	    System.out.println("Expected parameters: <job class> <input dir> <output dir>");
	    System.exit(-1);
	} else if ("WordCount".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(WordCount.ReducerImpl.class);
	    job.setMapperClass(WordCount.MapperImpl.class);
	    job.setOutputKeyClass(WordCount.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(WordCount.OUTPUT_VALUE_CLASS);

	} else if ("AccessLog".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(AccessLog.ReducerImpl.class);
	    job.setMapperClass(AccessLog.MapperImpl.class);
	    job.setOutputKeyClass(AccessLog.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(AccessLog.OUTPUT_VALUE_CLASS);

	} else if ("UrlPath".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(UrlPath.ReducerImpl.class);
	    job.setMapperClass(UrlPath.MapperImpl.class);
	    job.setOutputKeyClass(UrlPath.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(UrlPath.OUTPUT_VALUE_CLASS);
		
		
		FileInputFormat.addInputPath(job, new Path(otherArgs[1]));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs[2]));
		
		job.waitForCompletion(true);
		// job1.setReducerClass(Sort.ReducerImpl.class);
	    job1.setMapperClass(SortTextNum.MapperImpl.class);
	    job1.setOutputKeyClass(SortTextNum.OUTPUT_KEY_CLASS);
	    job1.setOutputValueClass(SortTextNum.OUTPUT_VALUE_CLASS);
		FileInputFormat.addInputPath(job1, new Path(otherArgs[3]));
        FileOutputFormat.setOutputPath(job1, new Path(otherArgs[4]));
		System.exit(job1.waitForCompletion(true) ? 0: 1);

	} else if ("ResponceCode".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(ResponceCode.ReducerImpl.class);
	    job.setMapperClass(ResponceCode.MapperImpl.class);
	    job.setOutputKeyClass(ResponceCode.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(ResponceCode.OUTPUT_VALUE_CLASS);

	} else if ("HostName".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(HostName.ReducerImpl.class);
	    job.setMapperClass(HostName.MapperImpl.class);
	    job.setOutputKeyClass(HostName.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(HostName.OUTPUT_VALUE_CLASS);

	} else if ("RequestCount".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(RequestCount.ReducerImpl.class);
	    job.setMapperClass(RequestCount.MapperImpl.class);
	    job.setOutputKeyClass(RequestCount.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(RequestCount.OUTPUT_VALUE_CLASS);

		FileInputFormat.addInputPath(job, new Path(otherArgs[1]));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs[2]));
		
		job.waitForCompletion(true);
		// job1.setReducerClass(Sort.ReducerImpl.class);
	    job1.setMapperClass(SortTextNum.MapperImpl.class);
	    job1.setOutputKeyClass(SortTextNum.OUTPUT_KEY_CLASS);
	    job1.setOutputValueClass(SortTextNum.OUTPUT_VALUE_CLASS);
		FileInputFormat.addInputPath(job1, new Path(otherArgs[3]));
        FileOutputFormat.setOutputPath(job1, new Path(otherArgs[4]));
		System.exit(job1.waitForCompletion(true) ? 0: 1);

	} else if ("MonthYear".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(MonthYear.ReducerImpl.class);
	    job.setMapperClass(MonthYear.MapperImpl.class);
	    job.setOutputKeyClass(MonthYear.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(MonthYear.OUTPUT_VALUE_CLASS);
		
	} else if ("BytesSent".equalsIgnoreCase(otherArgs[0])) {
	    job.setReducerClass(BytesSent.ReducerImpl.class);
	    job.setMapperClass(BytesSent.MapperImpl.class);
	    job.setOutputKeyClass(BytesSent.OUTPUT_KEY_CLASS);
	    job.setOutputValueClass(BytesSent.OUTPUT_VALUE_CLASS);
		FileInputFormat.addInputPath(job, new Path(otherArgs[1]));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs[2]));
		
		job.waitForCompletion(true);
		// job1.setReducerClass(Sort.ReducerImpl.class);
	    job1.setMapperClass(SortTextNum.MapperImpl.class);
	    job1.setOutputKeyClass(SortTextNum.OUTPUT_KEY_CLASS);
	    job1.setOutputValueClass(SortTextNum.OUTPUT_VALUE_CLASS);
		FileInputFormat.addInputPath(job1, new Path(otherArgs[3]));
        FileOutputFormat.setOutputPath(job1, new Path(otherArgs[4]));
		System.exit(job1.waitForCompletion(true) ? 0: 1);

	}    else {
	    System.out.println("Unrecognized job: " + otherArgs[0]);
	    System.exit(-1);
	}

        FileInputFormat.addInputPath(job, new Path(otherArgs[1]));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs[2]));

        System.exit(job.waitForCompletion(true) ? 0: 1);
    }

}
