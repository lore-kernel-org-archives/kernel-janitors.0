From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:00 +0000
Subject: [PATCH 02/12] staging: lustre: fld: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/fld/fld_cache.c   |    2 +-
 drivers/staging/lustre/lustre/fld/fld_request.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/fld/fld_request.c b/drivers/staging/lustre/lustre/fld/fld_request.c
--- a/drivers/staging/lustre/lustre/fld/fld_request.c
+++ b/drivers/staging/lustre/lustre/fld/fld_request.c
@@ -222,7 +222,7 @@ int fld_client_add_target(struct lu_clie
 			fld->lcf_name, name, tar->ft_idx);
 
 	target = kzalloc(sizeof(*target), GFP_NOFS);
-	if (target = NULL)
+	if (!target)
 		return -ENOMEM;
 
 	spin_lock(&fld->lcf_lock);
diff -u -p a/drivers/staging/lustre/lustre/fld/fld_cache.c b/drivers/staging/lustre/lustre/fld/fld_cache.c
--- a/drivers/staging/lustre/lustre/fld/fld_cache.c
+++ b/drivers/staging/lustre/lustre/fld/fld_cache.c
@@ -70,7 +70,7 @@ struct fld_cache *fld_cache_init(const c
 	LASSERT(cache_threshold < cache_size);
 
 	cache = kzalloc(sizeof(*cache), GFP_NOFS);
-	if (cache = NULL)
+	if (!cache)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&cache->fci_entries_head);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
