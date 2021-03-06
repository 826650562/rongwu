package com.clint.untils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Sjm {
	// TODO Auto-generated method stub
	// 验证码字符集
	private static final char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
			'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	private static final int SIZE = 4;
	private static final int LINES = 5;
	private static final int WIDTH = 80;
	private static final int HEIGHT = 60;
	private static final int FONT_SIZE = 30;

	/** * 生成随机验证码及图片 * Object[0]验证码字符串String * Object[1]验证码图片 BufferedImage */
	public static Object[] createImage() {
		StringBuffer sb = new StringBuffer();
		// 1.创建空白图片
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		// 2.获取图片画笔
		Graphics graphic = image.getGraphics(); // 3.设置画笔颜色
		graphic.setColor(Color.LIGHT_GRAY); // 4.绘制矩形背景
		graphic.fillRect(0, 0, WIDTH, HEIGHT); // 5.画随机字符
		Random ran = new Random();
		for (int i = 0; i < SIZE; i++) { // 取随机字符索引
			int n = ran.nextInt(chars.length); // 设置随机颜色
			graphic.setColor(getRandomColor()); // 设置字体大小
			graphic.setFont(new Font(null, Font.BOLD + Font.ITALIC, FONT_SIZE)); // 画字符
			graphic.drawString(chars[n] + "", i * WIDTH / SIZE, HEIGHT / 2); // 记录字符
			sb.append(chars[n]);
		} // 6.画干扰线
		for (int i = 0; i < LINES; i++) { // 设置随机颜色
			graphic.setColor(getRandomColor()); // 随机画线
			graphic.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
		} // 7.返回验证码和图片
		return new Object[] { sb.toString(), image };
	}

	/** * 随机取色 */
	public static Color getRandomColor() {
		Random ran = new Random();
		Color color = new Color(ran.nextInt(256), ran.nextInt(256), ran.nextInt(256));
		return color;
	}

	public static void setyzm(HttpServletRequest req, HttpServletResponse response) throws IOException {
		Object[] objs = createImage();
		HttpSession session = req.getSession();
		session.setAttribute("validateCode", objs[0]);
		BufferedImage image = (BufferedImage) objs[1]; // 图片格式可以自定义，java对png图片显示更清楚，输出路径可自定义
		response.setContentType("image/jpeg");
		// 输出图像
		ServletOutputStream outStream = response.getOutputStream();
		ImageIO.write(image, "jpeg", outStream);
		outStream.close();
	}

}
