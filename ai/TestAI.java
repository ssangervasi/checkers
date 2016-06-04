package checkers.ai;

import checkers.ai.AI;

class TestAI {
	public static void main(String[] args) {
		AI jonnyfive = new AI(3);
		assert jonnyfive.x == 3 : jonnyfive;
		System.out.println("Done");
	}

}