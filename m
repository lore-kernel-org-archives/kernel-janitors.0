From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Aug 2019 10:33:10 +0000
Subject: [PATCH] ima: Fix a use after free in ima_read_modsig()
Message-Id: <20190808103310.GC30506@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.ibm.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

This code frees "hdr" and then dereferences it on the next line to get
the error code.

Fixes: 39b07096364a ("ima: Implement support for module-style appended signatures")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 security/integrity/ima/ima_modsig.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index c412e31d1714..d106885cc495 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -91,8 +91,9 @@ int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 
 	hdr->pkcs7_msg = pkcs7_parse_message(buf + buf_len, sig_len);
 	if (IS_ERR(hdr->pkcs7_msg)) {
+		rc = PTR_ERR(hdr->pkcs7_msg);
 		kfree(hdr);
-		return PTR_ERR(hdr->pkcs7_msg);
+		return rc;
 	}
 
 	memcpy(hdr->raw_pkcs7, buf + buf_len, sig_len);
-- 
2.20.1
