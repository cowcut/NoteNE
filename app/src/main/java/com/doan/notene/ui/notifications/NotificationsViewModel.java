package com.doan.notene.ui.notifications;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

/**
 * ViewModel for the notifications fragment.
 */
public class NotificationsViewModel extends ViewModel {

    // MutableLiveData to store the text to be displayed in the fragment
    private final MutableLiveData<String> mNotificationsText;

    /**

