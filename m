From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 May 2015 21:36:46 +0000
Subject: [PATCH 2/2] staging: lustre: cl_page: delete empty macros
Message-Id: <1431121006-23857-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431121006-23857-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1431121006-23857-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

CS_PAGE_INC etc. do nothing, so remove them.

The semantic patch that performs this transformation is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression o,item,state; @@
(
- CS_PAGE_INC(o, item);
|
- CS_PAGE_DEC(o, item);
|
- CS_PAGESTATE_INC(o, state);
|
- CS_PAGESTATE_DEC(o, state);
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/cl_page.c |   17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/cl_page.c b/drivers/staging/lustre/lustre/obdclass/cl_page.c
index 59d338a..a7f3032 100644
--- a/drivers/staging/lustre/lustre/obdclass/cl_page.c
+++ b/drivers/staging/lustre/lustre/obdclass/cl_page.c
@@ -62,12 +62,6 @@ static void cl_page_delete0(const struct lu_env *env, struct cl_page *pg,
 # define PINVRNT(env, page, exp) \
 	((void)sizeof(env), (void)sizeof(page), (void)sizeof !!(exp))
 
-/* Disable page statistic by default due to huge performance penalty. */
-#define CS_PAGE_INC(o, item)
-#define CS_PAGE_DEC(o, item)
-#define CS_PAGESTATE_INC(o, state)
-#define CS_PAGESTATE_DEC(o, state)
-
 /**
  * Internal version of cl_page_top, it should be called if the page is
  * known to be not freed, says with page referenced, or radix tree lock held,
@@ -264,8 +258,6 @@ static void cl_page_free(const struct lu_env *env, struct cl_page *page)
 		list_del_init(page->cp_layers.next);
 		slice->cpl_ops->cpo_fini(env, slice);
 	}
-	CS_PAGE_DEC(obj, total);
-	CS_PAGESTATE_DEC(obj, page->cp_state);
 	lu_object_ref_del_at(&obj->co_lu, &page->cp_obj_ref, "cl_page", page);
 	cl_object_put(env, obj);
 	lu_ref_fini(&page->cp_reference);
@@ -323,11 +315,6 @@ static struct cl_page *cl_page_alloc(const struct lu_env *env,
 				}
 			}
 		}
-		if (result = 0) {
-			CS_PAGE_INC(o, total);
-			CS_PAGE_INC(o, create);
-			CS_PAGESTATE_DEC(o, CPS_CACHED);
-		}
 	} else {
 		page = ERR_PTR(-ENOMEM);
 	}
@@ -360,7 +347,6 @@ static struct cl_page *cl_page_find0(const struct lu_env *env,
 	might_sleep();
 
 	hdr = cl_object_header(o);
-	CS_PAGE_INC(o, lookup);
 
 	CDEBUG(D_PAGE, "%lu@"DFID" %p %lx %d\n",
 	       idx, PFID(&hdr->coh_lu.loh_fid), vmpage, vmpage->private, type);
@@ -387,7 +373,6 @@ static struct cl_page *cl_page_find0(const struct lu_env *env,
 	}
 
 	if (page != NULL) {
-		CS_PAGE_INC(o, hit);
 		return page;
 	}
 
@@ -554,8 +539,6 @@ static void cl_page_state_set0(const struct lu_env *env,
 		PASSERT(env, page,
 			equi(state = CPS_OWNED, page->cp_owner != NULL));
 
-		CS_PAGESTATE_DEC(page->cp_obj, page->cp_state);
-		CS_PAGESTATE_INC(page->cp_obj, state);
 		cl_page_state_set_trust(page, state);
 	}
 }

