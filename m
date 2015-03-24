From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Mar 2015 09:21:07 +0000
Subject: [patch 2/2] tpm, st33zp24: potential underflow in st33zp24_recv()
Message-Id: <20150324092107.GB24154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers don't like the min_t() casting because "count" can be
negative when we cast it to int.  Fix the casting, and change the caller
so that "count" can't be negative.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index 03f2543..7712e31 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -350,7 +350,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
-		len = min_t(int, burstcnt, count - size);
+		len = min_t(size_t, burstcnt, count - size);
 		ret = tpm_dev->ops->recv(tpm_dev->phy_id, TPM_DATA_FIFO,
 					 buf + size, len);
 		if (ret < 0)
@@ -492,7 +492,7 @@ static int st33zp24_recv(struct tpm_chip *chip, unsigned char *buf,
 	}
 
 	expected = be32_to_cpu(*(__be32 *)(buf + 2));
-	if (expected > count) {
+	if (expected < TPM_HEADER_SIZE || expected > count) {
 		size = -EIO;
 		goto out;
 	}
