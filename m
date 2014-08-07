From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 12:49:09 +0000
Subject: [PATCH 5/5] kexec: fix error return code
Message-Id: <1407415749-19978-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Biederman <ebiederm@xmission.com>
Cc: kernel-janitors@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 kernel/kexec.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 0b49a0a..dcd7a1f 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -2212,8 +2212,10 @@ static int kexec_calculate_store_digests(struct kimage *image)
 
 	sha_region_sz = KEXEC_SEGMENT_MAX * sizeof(struct kexec_sha_region);
 	sha_regions = vzalloc(sha_region_sz);
-	if (!sha_regions)
+	if (!sha_regions) {
+		ret = -ENOMEM;
 		goto out_free_desc;
+	}
 
 	desc->tfm   = tfm;
 	desc->flags = 0;

