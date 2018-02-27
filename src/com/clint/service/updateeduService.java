package com.clint.service;

public interface updateeduService {

	public void savePerson();

	/**
	 * @param edu
	 *            插入一条积分记录
	 */
	public void insertJifen(int edu);

	/**
	 * @param edu
	 *            积分总额度更新 数值
	 * @param tage
	 *            是加 还是减少
	 */
	public void updateJifenSum(int edu, String tage);

}
