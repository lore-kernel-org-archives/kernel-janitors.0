From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:10 +0000
Subject: [PATCH 3/15] drivers/rtc: removes unnecessary semicolon
Message-Id: <1347469402-27557-3-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/rtc/rtc-isl12022.c |    2 +-
 drivers/rtc/rtc-pcf8563.c  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 1850104..6b4298e 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -227,7 +227,7 @@ static int isl12022_set_datetime(struct i2c_client *client, struct rtc_time *tm)
 					 buf[ISL12022_REG_SC + i]);
 		if (ret)
 			return -EIO;
-	};
+	}
 
 	return 0;
 }
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index c2fe426..3694c9c 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -172,7 +172,7 @@ static int pcf8563_set_datetime(struct i2c_client *client, struct rtc_time *tm)
 				__func__, err, data[0], data[1]);
 			return -EIO;
 		}
-	};
+	}
 
 	return 0;
 }

