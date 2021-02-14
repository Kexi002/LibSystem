package com.kexi.test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;

public class TestOther {

    @Test
    public void testTimestamp(){
/*        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //Date date = timestamp;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //Timestamp timestamp = Timestamp.valueOf("2021-02-08");
                System.out.println(sdf.format(timestamp));*/

        Timestamp timestamp0  = new Timestamp(System.currentTimeMillis());
        Calendar c = Calendar.getInstance();
        c.setTime(timestamp0);
        //c.add(Calendar.DATE, 1);  //  加一  天
        c.add(Calendar.MONTH, 1); //  加一个月
        //c.add(Calendar.YEAR,1);   //  加一  年
        Timestamp time1 = new Timestamp(c.getTimeInMillis());
        System.out.println(time1);

    }

    @Test
    public void testTime(){
        Timestamp timestamp0  = new Timestamp(System.currentTimeMillis());
        Calendar c = Calendar.getInstance();
        c.setTime(timestamp0);
        //c.add(Calendar.DATE, 1);  //  加一  天
        c.add(Calendar.DATE, 30); //  加一个月
        //c.add(Calendar.YEAR,1);   //  加一  年
        Timestamp timestamp1 = new Timestamp(c.getTimeInMillis());

        System.out.println(timestamp0);
        System.out.println(timestamp1);



        System.out.println((System.currentTimeMillis() - timestamp0.getTime())/(1000*24*3600));
    }

    @Test
    public void testMath(){
        System.out.println((-1)/7);
    }

    @Test
    public void testSublist(){
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= 10; i++) {
            list.add(i);
        }
        System.out.println(list);
        list = list.subList(0, 7);
        System.out.println(list);

    }


}
