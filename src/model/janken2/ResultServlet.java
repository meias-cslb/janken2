package model.janken2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Result
 */
@WebServlet("/result")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int wincount = 0;
	private int losecount = 0;
	private int drawcount = 0;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String jsp = null;
//		保持するためのセッションを生成
		HttpSession session=request.getSession();

//		勝数のリセットボタンを押されたらカウントを0にする
		String action=request.getParameter("action");
	    if(action != null && action.equals("reset")){
	    	this.wincount = 0;
	    	this.losecount = 0;
	    	this.drawcount = 0;
		    session.setAttribute("wincount", this.wincount);
		    session.setAttribute("losecount", this.losecount);
		    session.setAttribute("drawcount", this.drawcount);
		    jsp = "/WEB-INF/jsp/top.jsp";

//		    それ以外
	    } else {

	//		プレイヤーの出したものを取得
			String select = request.getParameter("hand");

			int player = 0;

//			選ばれず送信されたらもう一度トップに戻り選んでもらう
			if(select == null || select.isEmpty()) {
				request.setAttribute("message", "選んで！");
				//		top.jspに転送準備
				jsp = "/WEB-INF/jsp/top.jsp";
			} else {
//				選ばれた手の数字を取得
				try {
	//				player = Integer.valueOf(select).intValue();
					player = Integer.parseInt(select);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}


		//		コンピューターの出すものをランダムで選ぶ
				int computer = (int)(Math.random() * 3) + 1;

//				勝敗のジャッジ
				String result = judgment(player, computer);

//				プレイヤーの手、コンピューターの手、勝敗結果、勝数をセット
				request.setAttribute("player", player);
				request.setAttribute("computer", computer);
				request.setAttribute("result", result);
				session.setAttribute("wincount", this.wincount);
			    session.setAttribute("losecount", this.losecount);
			    session.setAttribute("drawcount", this.drawcount);

		//		result.jspに転送準備
				jsp = "/WEB-INF/jsp/result.jsp";
			}
	    }
//		jspに転送し、表示
		RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	private String judgment(int player, int computer) {
		String result = null;

//		あいこ
		if(player == computer) {
			result = "Draw";
			this.drawcount++;
		} else {

	//		グーを選んだ時
			if(player == 1) {
				if(computer == 2) {
					result = "WIN!";
					this.wincount++;
				} else if(computer == 3) {
					result = "Lose…";
					this.losecount++;
				}
			}

	//		チョキを選んだ時
			if(player == 2) {
				if(computer == 3) {
					result = "WIN!";
					this.wincount++;
				} else if(computer == 1)  {
					result = "Lose…";
					this.losecount++;
				}
			}

	//		パーを選んだ時
			if(player == 3) {
				if(computer == 1) {
					result = "WIN!";
					this.wincount++;
				} else if(computer == 2) {
					result = "Lose…";
					this.losecount++;
				}
			}
		}

		return result;
	}

}
