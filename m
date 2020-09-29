From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:35 +0000
Subject: [PATCH 12/20] media: msp3400: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-13-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/i2c/msp3400-kthreads.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
index 52e506f86de5..ecabc0e1d32e 100644
--- a/drivers/media/i2c/msp3400-kthreads.c
+++ b/drivers/media/i2c/msp3400-kthreads.c
@@ -549,8 +549,10 @@ int msp3400c_thread(void *data)
 			val = msp_read_dsp(client, 0x1b);
 			if (val > 32767)
 				val -= 65536;
-			if (val1 < val)
-				val1 = val, max1 = i;
+			if (val1 < val) {
+				val1 = val;
+				max1 = i;
+			}
 			dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"carrier1 val: %5d / %s\n", val, cd[i].name);
 		}
@@ -586,8 +588,10 @@ int msp3400c_thread(void *data)
 			val = msp_read_dsp(client, 0x1b);
 			if (val > 32767)
 				val -= 65536;
-			if (val2 < val)
-				val2 = val, max2 = i;
+			if (val2 < val) {
+				val2 = val;
+				max2 = i;
+			}
 			dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"carrier2 val: %5d / %s\n", val, cd[i].name);
 		}
