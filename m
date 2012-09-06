From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 16:09:12 +0000
Subject: [PATCH 4/10] drivers/media/dvb-frontends/sp8870.c: removes unnecessary semicolon
Message-Id: <1346947757-10481-5-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/dvb-frontends/sp8870.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/media/dvb-frontends/sp8870.c b/drivers/media/dvb-frontends/sp8870.c
--- a/drivers/media/dvb-frontends/sp8870.c
+++ b/drivers/media/dvb-frontends/sp8870.c
@@ -188,7 +188,7 @@ static int configure_reg0xc05 (struct dt
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	switch (p->hierarchy) {
 	case HIERARCHY_NONE:
@@ -207,7 +207,7 @@ static int configure_reg0xc05 (struct dt
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	switch (p->code_rate_HP) {
 	case FEC_1_2:
@@ -229,7 +229,7 @@ static int configure_reg0xc05 (struct dt
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (known_parameters)
 		*reg0xc05 |= (2 << 1);	/* use specified parameters */

