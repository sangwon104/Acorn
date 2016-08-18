package kr.co.test.app2;

public class SystemMonitor {
	Sender sender;
	public SystemMonitor(){}
	public SystemMonitor(Sender sender){
		this.sender = sender;
	}
	public void print(){
		System.out.println("SystemMonitor 클래스의 print()");
		sender.show();
	}
	public void setSender(Sender sender) {
		this.sender = sender;
	}
	
	
}
