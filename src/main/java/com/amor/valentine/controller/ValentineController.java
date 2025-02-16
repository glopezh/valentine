package com.amor.valentine.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/valentine")
public class ValentineController {
        @GetMapping
        public String askValentine() {
            return "Sergi, ¿Quieres ser mi Valentine? 💕";
    }
}
