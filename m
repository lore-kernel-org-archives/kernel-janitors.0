From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:55:24 +0000
Subject: [PATCH] kexec: Fix error code in kexec_calculate_store_digests()
Message-Id: <X9B03LFICh/QykQ6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Biederman <ebiederm@xmission.com>, Dave Young <dyoung@redhat.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM on allocation failure instead of returning success.

Fixes: a43cac0d9dc2 ("kexec: split kexec_file syscall code to kexec_file.c")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/kexec_file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index b02086d70492..9570f380a825 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -735,8 +735,10 @@ static int kexec_calculate_store_digests(struct kimage *image)
 
 	sha_region_sz = KEXEC_SEGMENT_MAX * sizeof(struct kexec_sha_region);
 	sha_regions = vzalloc(sha_region_sz);
-	if (!sha_regions)
+	if (!sha_regions) {
+		ret = -ENOMEM;
 		goto out_free_desc;
+	}
 
 	desc->tfm   = tfm;
 
-- 
2.29.2
