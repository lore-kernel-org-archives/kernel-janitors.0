From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 07:28:51 +0000
Subject: [patch 1/2] [media] ds3000: using logical && instead of bitwise &
Message-Id: <20120117072851.GA11358@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: "Igor M. Liplianin" <liplianin@me.by>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent here was to test if the FE_HAS_LOCK was set.  The current
test is equivalent to "if (status) { ..."

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/frontends/ds3000.c b/drivers/media/dvb/frontends/ds3000.c
index 9387770..af65d01 100644
--- a/drivers/media/dvb/frontends/ds3000.c
+++ b/drivers/media/dvb/frontends/ds3000.c
@@ -1195,7 +1195,7 @@ static int ds3000_set_frontend(struct dvb_frontend *fe)
 
 	for (i = 0; i < 30 ; i++) {
 		ds3000_read_status(fe, &status);
-		if (status && FE_HAS_LOCK)
+		if (status & FE_HAS_LOCK)
 			break;
 
 		msleep(10);
