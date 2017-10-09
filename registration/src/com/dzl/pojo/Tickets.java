package com.dzl.pojo;

import java.io.Serializable;
import java.util.Date;

public class Tickets implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer rid;
	private Integer cid;
	private Integer bid;
	private Integer snum;
	private Integer state;
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public Integer getSnum() {
		return snum;
	}
	public void setSnum(Integer snum) {
		this.snum = snum;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public Tickets() {
		super();
	}
	
	
}
