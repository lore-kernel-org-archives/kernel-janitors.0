From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Jul 2017 14:45:11 +0000
Subject: [PATCH net] mcs7780: Silence uninitialized variable warning
Message-Id: <20170728144511.tf7nc672hwo35rnn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that, if the allocation in mcs_get_reg()
fails, it means we use "rval" without initializing it.  Small
allocations never fail in current kernels so it's not a major concern
but it's simple enough to silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/irda/mcs7780.c b/drivers/net/irda/mcs7780.c
index 765de3bedb88..64b29880e534 100644
--- a/drivers/net/irda/mcs7780.c
+++ b/drivers/net/irda/mcs7780.c
@@ -585,7 +585,7 @@ static int mcs_speed_change(struct mcs_cb *mcs)
 	int rst = 0;
 	int cnt = 0;
 	__u16 nspeed;
-	__u16 rval;
+	__u16 rval = -1;
 
 	nspeed = mcs_speed_set[(mcs->new_speed >> 8) & 0x0f];
 
