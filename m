From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 12:22:29 +0000
Subject: [PATCH] misc: kgdbts: silence array underflow warning
Message-Id: <20180517122229.GA7655@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch distrusts simple_strtol().  I don't know the code well enough
to say if the distrust is justified here, but it seems harmless to
silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 6193270e7b3d..e0508acaedaa 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -400,13 +400,15 @@ static void skip_back_repeat_test(char *arg)
 	int go_back = simple_strtol(arg, NULL, 10);
 
 	repeat_test--;
-	if (repeat_test <= 0) {
+	if (repeat_test <= 0 || go_back < 0) {
 		ts.idx++;
 	} else {
 		if (repeat_test % 100 = 0)
 			v1printk("kgdbts:RUN ... %d remaining\n", repeat_test);
 
 		ts.idx -= go_back;
+		if (ts.idx < 0)
+			ts.idx = 0;
 	}
 	fill_get_buf(ts.tst[ts.idx].get);
 }
