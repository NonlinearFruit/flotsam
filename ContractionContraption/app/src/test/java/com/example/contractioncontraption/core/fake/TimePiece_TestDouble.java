package com.example.contractioncontraption.core.fake;

import com.example.contractioncontraption.core.TimePiece;

import java.time.LocalDateTime;

public class TimePiece_TestDouble implements TimePiece {
    public int CountOfCallsToGetTime;
    public LocalDateTime ReturnForGetTime;

    @Override
    public LocalDateTime getTime() {
        CountOfCallsToGetTime++;
        return ReturnForGetTime;
    }
}
