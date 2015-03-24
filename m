From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Mar 2015 09:19:50 +0000
Subject: [patch 1/2] tpm, tpm_tis: potential underflow bug in tpm_tis_recv()
Message-Id: <20150324091950.GA24154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "expected" is less than TPM_HEADER_SIZE (10) then it could mean we
try to read a negative number of bytes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index f2dffa7..aa96ecd 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -258,7 +258,7 @@ static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	}
 
 	expected = be32_to_cpu(*(__be32 *) (buf + 2));
-	if (expected > count) {
+	if (expected < TPM_HEADER_SIZE || expected > count) {
 		size = -EIO;
 		goto out;
 	}
