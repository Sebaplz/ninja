package com.seba.ninja.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

@Controller
public class MainController {
    @PostMapping("/gold")
    public String enviarGold(HttpSession session, @RequestParam(value = "lugar", required = false)
    String lugar) {
        //variables de inicio
        int gold = 0;
        ArrayList<String> actividades = new ArrayList<String>();
        String formatoFecha = new SimpleDateFormat("MMM d YYYY hh:mm:ss").format(new Date());

        if (session.getAttribute("gold") == null) {
            session.setAttribute("gold", gold);
            session.setAttribute("actividades", actividades);
        }else{
            gold = (int) session.getAttribute("gold");
            actividades = (ArrayList<String>) session.getAttribute("actividades");
        }

        if (lugar.equals("farm")){
            int cantidad = new Random().nextInt(10, 20);
            System.out.println(cantidad);
            gold += cantidad;
            actividades.add(0,"You entered a farm and earned " + cantidad + " gold " + formatoFecha);
            session.setAttribute("actividades", actividades);
            System.out.println("cuanto oro hay: " + gold);
            session.setAttribute("gold", gold);
            return "redirect:/gold";
        }

        if (lugar.equals("cave")){
            int cantidad = new Random().nextInt(5,10);
            System.out.println(cantidad);
            gold += cantidad;
            actividades.add(0,"You entered a cave and earned " + cantidad + " gold " + formatoFecha);
            session.setAttribute("actividades", actividades);
            System.out.println("cuanto oro hay: " + gold);
            session.setAttribute("gold", gold);
            return "redirect:/gold";
        }

        if (lugar.equals("house")){
            int cantidad = new Random().nextInt(2,5);
            System.out.println(cantidad);
            gold += cantidad;
            actividades.add(0, "You entered a house and earned " + cantidad + " gold " + formatoFecha);
            session.setAttribute("actividades", actividades);
            System.out.println("cuanto oro hay: " + gold);
            session.setAttribute("gold", gold);
            return "redirect:/gold";
        }

        if (lugar.equals("casino")){
            int cantidad = new Random().nextInt(-50, 50);
            System.out.println(cantidad);
            if (cantidad >= 0){
                gold += cantidad;
                actividades.add(0,"You entered a casino and earned " + cantidad + " gold " + formatoFecha);
            }else {
                gold += cantidad;
                actividades.add(0,"You entered a casino and lost " + cantidad + " gold " + formatoFecha);
            }
            session.setAttribute("actividades", actividades);
            System.out.println("cuanto oro hay: " + gold);
            session.setAttribute("gold", gold);
            return "redirect:/gold";
        }

        if (lugar.equals("spa")){
            int cantidad = new Random().nextInt(-20, -5);
            System.out.println(cantidad);
            gold += cantidad;
            actividades.add(0, "You entered a spa and lost " + cantidad + " gold " + formatoFecha);
            session.setAttribute("actividades", actividades);
            System.out.println("cuanto oro hay: " + gold);
            session.setAttribute("gold", gold);
            return "redirect:/gold";
        }
        return "redirect:/gold";
    }

    @GetMapping("/gold")
    public String index(HttpSession session, Model model) {
        model.addAttribute("gold", session.getAttribute("gold"));
        model.addAttribute("actividades", session.getAttribute("actividades"));
        return "gold.jsp";
    }

    @PostMapping("/reset")
    public String reset(HttpSession session){
        session.invalidate();
        return "redirect:/gold";
    }

}
