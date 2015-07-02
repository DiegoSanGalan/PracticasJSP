package service;

import java.util.Random;

public class Calcular {

	public Calcular()
	{
		
	}
	
	/**
	 * Recibo dos numeros max y min y devuelve la mitad
	 * @param max
	 * @param min
	 * @return
	 */
	public Integer Media (Integer max, Integer min)
	{
		Integer num = 0;
		num= (max+min)/2;
		
		return num;
	}
	
	public static Integer numeroAleatorio (Integer min, Integer max)
	{
		Random rand = new Random();
		Integer randomNum = rand.nextInt((max - min) + 1) + min;
		return randomNum;
	}
	
	
	
}
