From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 May 2017 20:10:53 +0000
Subject: [PATCH 8/9] clocksource/drivers/fttmr010: Drop unnecessary static
Message-Id: <1493928654-18768-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any use, on every possible execution path through the function.  The static
has no benefit, and dropping it reduces the code size.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@

static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@

-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

The change in code size is indicates by the following output from the size
command.

before:
   text    data     bss     dec     hex filename
   1777    4352      20    6149    1805 drivers/clocksource/timer-fttmr010.o

after:
   text    data     bss     dec     hex filename
   1770    4352      12    6134    17f6 drivers/clocksource/timer-fttmr010.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clocksource/timer-fttmr010.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index b4a6f1e..055c65e 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -263,7 +263,7 @@ static int __init fttmr010_timer_of_init(struct device_node *np)
 
 static int __init gemini_timer_of_init(struct device_node *np)
 {
-	static struct regmap *map;
+	struct regmap *map;
 	int ret;
 	u32 val;
 

