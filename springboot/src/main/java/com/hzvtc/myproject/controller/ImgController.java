package com.hzvtc.myproject.controller;

import com.hzvtc.myproject.config.Constant;
import com.hzvtc.myproject.exception.HttpException;
import com.hzvtc.myproject.utils.HttpCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URI;
import java.net.URLEncoder;

@Controller
public class ImgController {

    @GetMapping("/upload_img/{imgPath}")
    public void getImage(@PathVariable("imgPath") String imgPath, HttpServletResponse response){
        String url = "";
        // 根据图片地址从指定路径加载文件流
        File file = new File(Constant.UPLOAD_PATH );
        url = file.getAbsolutePath() + "/"+ imgPath;

        // 处理文件流返回
        File viewFile = new File(url);
        if (!viewFile.exists()) {
            throw new HttpException(HttpCode.FAILED,"没有文件");
        }


        try (FileInputStream is = new FileInputStream(viewFile); BufferedInputStream bis = new BufferedInputStream(is)) {
            OutputStream out = response.getOutputStream();
            byte[] buf = new byte[1024];
            int bytesRead;
            while ((bytesRead = bis.read(buf)) > 0) {
                out.write(buf, 0, bytesRead);
            }
        } catch (IOException e) {
            throw new HttpException(HttpCode.FAILED,"读取下载文件出错" + e);
        }

    }
}
