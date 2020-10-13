From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Oct 2020 16:53:16 +0000
Subject: [PATCH][V2] ima: Fix sizeof mismatches
Message-Id: <20201013165316.215897-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@polito.it>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof is being used, sizeof(*fields) is not correct,
it should be sizeof(**fields). This is not causing a problem since
the size of these is the same. Fix this. 

Also replace kmalloc_array and memcpy with a kmemdup.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 1bd7face7439 ("ima: allocate field pointers array on demand in template_desc_init_fields()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Replace kmalloc_array and memcpy with kmemdup as suggested by
    Joe Perches.

---
 security/integrity/ima/ima_template.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
index 1e89e2d3851f..83886e767678 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -216,11 +216,10 @@ int template_desc_init_fields(const char *template_fmt,
 	}
 
 	if (fields && num_fields) {
-		*fields = kmalloc_array(i, sizeof(*fields), GFP_KERNEL);
+		*fields = kmemdup(found_fields, i * sizeof(**fields), GFP_KERNEL);
 		if (*fields = NULL)
 			return -ENOMEM;
 
-		memcpy(*fields, found_fields, i * sizeof(*fields));
 		*num_fields = i;
 	}
 
-- 
2.27.0
