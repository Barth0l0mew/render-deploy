package render.spring.SpringDeployRender;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;

@Controller
public class MainController {
    @GetMapping({"","/","/index"})
    public String index(Model model) {
        System.out.println(LocalDateTime.now());
        model.addAttribute("date", LocalDateTime.now());
        return "index";
    }
}
