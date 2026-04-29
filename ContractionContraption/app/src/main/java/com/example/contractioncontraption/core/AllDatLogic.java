package com.example.contractioncontraption.core;

import java.util.List;

public interface AllDatLogic {
    void startContraction();
    void missedContraction();
    List<Long> getContrcationIntervals();
}
