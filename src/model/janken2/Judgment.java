package model.janken2;

public class Judgment {

	public Player playerCount() {
			Player p = new Player();
		return p;
	}

	public String jadg(int player, int computer, Player p) {
		String result = null;

//		あいこ
		if(player == computer) {
			result = "あいこ！";
		} else {

	//		グーを選んだ時
			if(player == 1) {
				if(computer == 2) {
					result = "WIN!";
					p.setCount(p.getCount() + 1);
				} else if(computer == 3) {
					result = "Lose…";
				}
			}

	//		チョキを選んだ時
			if(player == 2) {
				if(computer == 3) {
					result = "WIN!";
					p.setCount(p.getCount() + 1);
				} else if(computer == 1)  {
					result = "Lose…";
				}
			}

	//		パーを選んだ時
			if(player == 3) {
				if(computer == 1) {
					result = "WIN!";
					p.setCount(p.getCount() + 1);
				} else if(computer == 2) {
					result = "Lose…";
				}
			}
		}

		return result;

	}
}
