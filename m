From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:35 +0000
Subject: [PATCH 15/16] staging: lustre: lnet: lnet: fix error return code
Message-Id: <1428235596-4757-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Return a negative error code on failure.

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
 drivers/staging/lustre/lnet/lnet/api-ni.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index faceb95..4a14e51 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -650,15 +650,19 @@ lnet_prepare(lnet_pid_t requested_pid)
 
 	recs = lnet_res_containers_create(LNET_COOKIE_TYPE_ME, LNET_FL_MAX_MES,
 					  sizeof(lnet_me_t));
-	if (recs = NULL)
+	if (recs = NULL) {
+		rc = -ENOMEM;
 		goto failed;
+	}
 
 	the_lnet.ln_me_containers = recs;
 
 	recs = lnet_res_containers_create(LNET_COOKIE_TYPE_MD, LNET_FL_MAX_MDS,
 					  sizeof(lnet_libmd_t));
-	if (recs = NULL)
+	if (recs = NULL) {
+		rc = -ENOMEM;
 		goto failed;
+	}
 
 	the_lnet.ln_md_containers = recs;
 

