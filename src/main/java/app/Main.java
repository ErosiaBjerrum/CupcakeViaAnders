package app;

import app.entities.*;
import app.persistence.*;

import java.util.List;

import app.config.ThymeleafConfig;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinThymeleaf;

public class Main {
    public static void main(String[] args) {

        Javalin app = Javalin.create(config -> {
            config.fileRenderer(new JavalinThymeleaf(ThymeleafConfig.templateEngine()));
            config.staticFiles.add("/public");
        }).start(7070);

        app.get("/", ctx -> ctx.render("index"));



    }
}