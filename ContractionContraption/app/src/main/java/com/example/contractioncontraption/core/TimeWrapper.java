package com.example.contractioncontraption.core;

import java.time.LocalDateTime;

public class TimeWrapper implements TimePiece{
    @Override
    public LocalDateTime getTime() {
        return LocalDateTime.now();
    }
}
