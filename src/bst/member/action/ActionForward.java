package bst.member.action;

public class ActionForward {
	private boolean isRedirect=false;
	private String path=null;
	
	/* JavaBeen 클래스 정의시
	 * boolean 타입일때만 한해서 getter 메서드는 getIsRedirect라고 짓지않고
	 * 그냥 isRedirect라고 짓기도 한다.
	 * 
	 * setter 메서드는 원래 형식대로 setIsRedirect라고 지어야 한다.
	 * 
	 * 근데 여기선 setRedirect로 이름이 자바빈 규약에 맞지 않음을 볼 수 있다.
	 * 이 말인 즉슨 이 코드에선 useBean 액션태그등에서 자바빈으로 사용하지 않을 것 이라는 의미가 되겠다.
	 * 다시말해 이 클래스는 jsp에서 사용하기 위해 정의한 것은 아니라는 의미가 되겠다.
	 * 그저 순수 자바에서만 사용하기 위해 임시적으로 만든 클래스임을 의미.
	 * */
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setPath(String string){
		path=string;
	}
}