From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:37 +0000
Subject: [PATCH 14/20] media: mt2060: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-15-git-send-email-Julia.Lawall@inria.fr>
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
 drivers/media/tuners/mt2060.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index 0e7ac2b49990..204e6186bf71 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -215,7 +215,7 @@ static int mt2060_set_params(struct dvb_frontend *fe)
 	f_lo2 = f_lo1 - freq - IF2;
 	// From the Comtech datasheet, the step used is 50kHz. The tuner chip could be more precise
 	f_lo2 = ((f_lo2 + 25) / 50) * 50;
-	priv->frequency =  (f_lo1 - f_lo2 - IF2) * 1000,
+	priv->frequency =  (f_lo1 - f_lo2 - IF2) * 1000;
 
 #ifdef MT2060_SPURCHECK
 	// LO-related spurs detection and correction
