From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Apr 2017 13:48:17 +0000
Subject: [PATCH] selftests/timers: fix spelling mistake: "Asynchronous"
Message-Id: <20170412134817.17369-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in printed message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/timers/clocksource-switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/clocksource-switch.c b/tools/testing/selftests/timers/clocksource-switch.c
index fd88e3025bed..5ff165373f8b 100644
--- a/tools/testing/selftests/timers/clocksource-switch.c
+++ b/tools/testing/selftests/timers/clocksource-switch.c
@@ -159,7 +159,7 @@ int main(int argv, char **argc)
 	}
 
 
-	printf("Running Asyncrhonous Switching Tests...\n");
+	printf("Running Asynchronous Switching Tests...\n");
 	pid = fork();
 	if (!pid)
 		return run_tests(60);
-- 
2.11.0

