package com.example.contractioncontraption.core;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertNotNull;

public class CoreLogicTests {
    @Test
    public void getContractionInterval_ReturnsEmpty_WhenNoData() {
        CoreLogic logic = new CoreLogic();

        List<Integer> list = logic.getContrcationIntervals();

        assertNotNull(list);
    }
}