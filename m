From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Jul 2017 15:29:16 +0000
Subject: [PATCH] [media] dvb_frontend: ensure that front end status is initialized
Message-Id: <20170720152916.24266-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Markus Elfring <elfring@users.sourceforge.net>, Hans Verkuil <hans.verkuil@cisco.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Shuah Khan <shuah@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The fe_status variable s is not initialized meaning it can have any
random garbage status.  This could be problematic if fe->ops.tune is
false as s is not updated by the call to fe->ops.tune() and a
subsequent check on the change status will using a garbage value.
Fix this by initializing s to zero.

Detected by CoverityScan, CID#112887 ("Uninitialized scalar variable")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index e3fff8f64d37..e18ea1508a59 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -631,7 +631,7 @@ static int dvb_frontend_thread(void *data)
 	struct dvb_frontend *fe = data;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
-	enum fe_status s;
+	enum fe_status s = 0;
 	enum dvbfe_algo algo;
 	bool re_tune = false;
 	bool semheld = false;
-- 
2.11.0

