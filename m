From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Sun, 27 Mar 2016 19:13:00 +0000
Subject: [PATCH 2/5] staging: xgifb: fix 'line over 80 characters'
Message-Id: <1459105983-17251-2-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'line over 80 characters'

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/xgifb/vb_init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/xgifb/vb_init.c b/drivers/staging/xgifb/vb_init.c
index 1ef2bfb..062ece2 100644
--- a/drivers/staging/xgifb/vb_init.c
+++ b/drivers/staging/xgifb/vb_init.c
@@ -552,7 +552,8 @@ static int XGINew_ReadWriteRest(unsigned short StopAddr,
 		writel(Position, fbaddr + Position);
 	}
 
-	usleep_range(500, 1500); /* Fix #1759 Memory Size error in Multi-Adapter. */
+	/* Fix #1759 Memory Size error in Multi-Adapter. */
+	usleep_range(500, 1500);
 
 	Position = 0;
 
-- 
1.9.1

