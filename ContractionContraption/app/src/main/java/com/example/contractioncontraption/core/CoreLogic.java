package com.example.contractioncontraption.core;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class CoreLogic implements AllDatLogic {
    private int count;
    private List<LocalDateTime> contractions = new ArrayList<>();
    private TimePiece time;

    public CoreLogic(TimePiece time) {
        this.time = time;
    }

    @Override
    public void startContraction() {
        contractions.add(time.getTime());
    }

    @Override
    public void missedContraction() {

    }

    @Override
    public List<Long> getContrcationIntervals() {
        List<Long> intervals = new ArrayList<>();
        for (int i = 1; i < contractions.size(); i++) {
            LocalDateTime first = contractions.get(i-1);
            LocalDateTime second = contractions.get(i);
            intervals.add(ChronoUnit.SECONDS.between(first, second));
        }
        return intervals;
    }
}
