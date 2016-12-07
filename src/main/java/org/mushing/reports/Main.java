package org.mushing.reports;

import java.io.File;

/**
 * Created by roman on 02.12.16.
 */
public class Main {
    public static void main(String[] args) {
        File file = new File("images/admin@admin.ru.jpg");
        System.out.println(file.getAbsolutePath()+" "+file.getPath());
    }
}
