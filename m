From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 May 2015 21:36:45 +0000
Subject: [PATCH 1/2] staging: lustre: cl_page: drop unneeded variable
Message-Id: <1431121006-23857-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431121006-23857-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1431121006-23857-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Drop variable made unnecessary by conversion of obd free functions
to kfree.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/cl_page.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/cl_page.c b/drivers/staging/lustre/lustre/obdclass/cl_page.c
index 8873553..59d338a 100644
--- a/drivers/staging/lustre/lustre/obdclass/cl_page.c
+++ b/drivers/staging/lustre/lustre/obdclass/cl_page.c
@@ -248,7 +248,6 @@ EXPORT_SYMBOL(cl_page_gang_lookup);
 static void cl_page_free(const struct lu_env *env, struct cl_page *page)
 {
 	struct cl_object *obj  = page->cp_obj;
-	int pagesize = cl_object_header(obj)->coh_page_bufsize;
 
 	PASSERT(env, page, list_empty(&page->cp_batch));
 	PASSERT(env, page, page->cp_owner = NULL);

