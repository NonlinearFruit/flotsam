package com.example.contractioncontraption.core;

import com.example.contractioncontraption.core.fake.TimePiece_TestDouble;

import org.junit.Before;
import org.junit.Test;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.Assert.*;

public class CoreLogicTests {

    private AllDatLogic logic;
    private TimePiece_TestDouble time;

    @Before
    public void setup() {
        time = new TimePiece_TestDouble();
        time.ReturnForGetTime = LocalDateTime.now();
        logic = new CoreLogic(time);
    }

    @Test
    public void startContraction() {
        logic.startContraction();

        assertEquals(1, time.CountOfCallsToGetTime);
    }

    @Test
    public void getContractionInterval_ReturnsEmpty_WhenNoData() {
        List<Long> list = logic.getContrcationIntervals();

        assertNotNull(list);
        assertEquals(0, list.size());
    }

    @Test
    public void getContractionInterval_ReturnsEmpty_WhenOneData() {
        logic.startContraction();
        List<Long> list = logic.getContrcationIntervals();

        assertNotNull(list);
        assertEquals(0, list.size());
    }

    @Test
    public void getContractionInterval_ReturnsOne_WhenTwoData() {
        logic.startContraction();
        logic.startContraction();
        List<Long> list = logic.getContrcationIntervals();

        assertNotNull(list);
        assertEquals(1, list.size());
    }

    @Test
    public void getContractionInterval_ReturnsTwo_WhenThreeData() {
        logic.startContraction();
        logic.startContraction();
        logic.startContraction();
        List<Long> list = logic.getContrcationIntervals();

        assertNotNull(list);
        assertEquals(2, list.size());
    }

    @Test
    public void getContractionInterval_ReturnsInterval() {
        Long seconds = 50L;
        LocalDateTime now = LocalDateTime.now();

        time.ReturnForGetTime = now;
        logic.startContraction();
        time.ReturnForGetTime = now.plusSeconds(seconds);
        logic.startContraction();
        List<Long> list = logic.getContrcationIntervals();

        assertNotNull(list);
        assertEquals(seconds, list.get(0));
    }
}