package com.doan.notene;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
public class ExampleUnitTest {

    @Test
    public void addition_isCorrect() {
        assertEquals(4, 2 + 2);
    }

    @Test
    public void subtraction_isCorrect() {
        assertEquals(0, 2 - 2);
    }

    @Test
    public void multiplication_isCorrect() {
        assertEquals(6, 2 * 3);
    }

    @Test
    public void division_isCorrect() {
        assertEquals(2, 6 / 3d);
    }

    @Test
    public void modulus_isCorrect() {
        assertEquals(1, 5 % 2);
    }

    @Test
    public void negativeNumbers_isCorrect() {
        assertEquals(-2, -1 - 1);
    }

    @Test
    public void zero_isCorrect() {
        assertEquals(0, 0 + 0);
    }
}
