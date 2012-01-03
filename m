From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jan 2012 13:17:48 +0000
Subject: [patch] TPM: handle errors from probe_itpm()
Message-Id: <20120103131748.GA11575@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <87ehw6sesk.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Debora Velarde <debora@linux.vnet.ibm.com>
Cc: Rajiv Andrade <srajiv@linux.vnet.ibm.com>, Marcel Selhorst <m.selhorst@sirrix.com>, Rusty Russell <rusty@rustcorp.com.au>, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently made itpm a bool in linux-next and it broke the error
handling here.  This patch also preserves the return codes from
probe_itpm() instead of always returning -ENODEV.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index a174862..08c6a07 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -538,11 +538,11 @@ static int tpm_tis_init(struct device *dev, resource_size_t start,
 		 vendor >> 16, ioread8(chip->vendor.iobase + TPM_RID(0)));
 
 	if (!itpm) {
-		itpm = probe_itpm(chip);
-		if (itpm < 0) {
-			rc = -ENODEV;
+		rc = probe_itpm(chip);
+		if (rc < 0)
 			goto out_err;
-		}
+		itpm = rc;
+		rc = 0;
 	}
 
 	if (itpm)
