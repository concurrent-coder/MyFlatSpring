package myflat.utils;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

/**
 * 
 * @author santosh
 *
 */
public class ImageUtil {

	public static byte[] resizer(InputStream orignalImage, int width, int height, String extension) {

		try {
			BufferedImage origBuffImg = ImageIO.read(orignalImage);
			int type = origBuffImg.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : origBuffImg.getType();

			BufferedImage resizedBuffImg = new BufferedImage(width, height, type);
			Graphics2D g = resizedBuffImg.createGraphics();
			g.drawImage(origBuffImg, 0, 0, width, height, null);
			g.dispose();

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(resizedBuffImg, "jpg", baos);
			byte[] bytes = baos.toByteArray();
			
			baos = null;
			origBuffImg = null;
			
			return bytes;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
