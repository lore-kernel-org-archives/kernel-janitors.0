From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:37 +0000
Subject: [PATCH 05/19] media: Change variable type to bool
Message-Id: <1379802471-30252-5-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.chehab@samsung.com
Cc: hfvogt@gmx.net, crope@iki.fi, peter.senna@gmail.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The variable vco_select is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/media/tuners/fc0012.c | 2 +-
 drivers/media/tuners/fc0013.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
index f4d0e79..d74e920 100644
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -139,7 +139,7 @@ static int fc0012_set_params(struct dvb_frontend *fe)
 	unsigned char reg[7], am, pm, multi, tmp;
 	unsigned long f_vco;
 	unsigned short xtal_freq_khz_2, xin, xdiv;
-	int vco_select = false;
+	bool vco_select = false;
 
 	if (fe->callback) {
 		ret = fe->callback(priv->i2c, DVB_FRONTEND_COMPONENT_TUNER,
diff --git a/drivers/media/tuners/fc0013.c b/drivers/media/tuners/fc0013.c
index bd8f0f1..b416231 100644
--- a/drivers/media/tuners/fc0013.c
+++ b/drivers/media/tuners/fc0013.c
@@ -233,7 +233,7 @@ static int fc0013_set_params(struct dvb_frontend *fe)
 	unsigned char reg[7], am, pm, multi, tmp;
 	unsigned long f_vco;
 	unsigned short xtal_freq_khz_2, xin, xdiv;
-	int vco_select = false;
+	bool vco_select = false;
 
 	if (fe->callback) {
 		ret = fe->callback(priv->i2c, DVB_FRONTEND_COMPONENT_TUNER,
-- 
1.8.3.1

