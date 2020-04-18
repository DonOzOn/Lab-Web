/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author DonOzOn
 */
public class QuestionHistory {
      private int id;
    private String studentName;
    private int numOfQuiz;
    private int correctAnswer;
    private Date date;
    private String status;

    public QuestionHistory() {
    }

    public QuestionHistory(int id, String studentName, int numOfQuiz, int correctAnswer, Date date, String status) {
        this.id = id;
        this.studentName = studentName;
        this.numOfQuiz = numOfQuiz;
        this.correctAnswer = correctAnswer;
        this.date = date;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getNumOfQuiz() {
        return numOfQuiz;
    }

    public void setNumOfQuiz(int numOfQuiz) {
        this.numOfQuiz = numOfQuiz;
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
