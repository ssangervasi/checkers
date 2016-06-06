class TestAI {
	public static void main(String[] args) {
		test();
	}

	public static void test() {
		AI jonnyfive = new AI(3);
		assert jonnyfive.x == 3 : jonnyfive;
		System.out.println("Done");
	}

}
