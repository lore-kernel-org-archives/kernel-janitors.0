From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 06:51:20 +0000
Subject: [patch] [media] it913x-fe: use ARRAY_SIZE() as a cleanup
Message-Id: <20120814065120.GA4791@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Malcolm Priestley <tvboxspy@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This code looks suspicious, but it turns out that "nv" is an array of u8
so sizeof() is the same as ARRAY_SIZE().  Using ARRAY_SIZE() is more
readable though.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/frontends/it913x-fe.c b/drivers/media/dvb/frontends/it913x-fe.c
index 708cbf1..6e1c6eb 100644
--- a/drivers/media/dvb/frontends/it913x-fe.c
+++ b/drivers/media/dvb/frontends/it913x-fe.c
@@ -199,7 +199,7 @@ static int it913x_init_tuner(struct it913x_fe_state *state)
 
 	if (reg < 0)
 		return -ENODEV;
-	else if (reg < sizeof(nv))
+	else if (reg < ARRAY_SIZE(nv))
 		nv_val = nv[reg];
 	else
 		nv_val = 2;
