From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 09:24:02 +0000
Subject: [patch] [media] stv0900: remove an unneeded check
Message-Id: <20140206092402.GA31780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Michael Krufky <mkrufky@linuxtv.org>, Cong Ding <dinggnu@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

No need to check "lock" twice here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-frontends/stv0900_sw.c b/drivers/media/dvb-frontends/stv0900_sw.c
index 0a40edfad739..4ce1d260b3eb 100644
--- a/drivers/media/dvb-frontends/stv0900_sw.c
+++ b/drivers/media/dvb-frontends/stv0900_sw.c
@@ -1081,7 +1081,7 @@ static int stv0900_wait_for_lock(struct stv0900_internal *intp,
 	lock = stv0900_get_demod_lock(intp, demod, dmd_timeout);
 
 	if (lock)
-		lock = lock && stv0900_get_fec_lock(intp, demod, fec_timeout);
+		lock = stv0900_get_fec_lock(intp, demod, fec_timeout);
 
 	if (lock) {
 		lock = 0;
