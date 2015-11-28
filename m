From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 28 Nov 2015 14:28:40 +0000
Subject: [PATCH] xen/grant-table: constify gnttab_ops structure
Message-Id: <1448720920-10606-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

The gnttab_ops structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/xen/grant-table.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index c49f79e..effbaf9 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -128,7 +128,7 @@ struct unmap_refs_callback_data {
 	int result;
 };
 
-static struct gnttab_ops *gnttab_interface;
+static const struct gnttab_ops *gnttab_interface;
 
 static int grant_table_version;
 static int grefs_per_grant_frame;
@@ -1013,7 +1013,7 @@ static int gnttab_map(unsigned int start_idx, unsigned int end_idx)
 	return rc;
 }
 
-static struct gnttab_ops gnttab_v1_ops = {
+static const struct gnttab_ops gnttab_v1_ops = {
 	.map_frames			= gnttab_map_frames_v1,
 	.unmap_frames			= gnttab_unmap_frames_v1,
 	.update_entry			= gnttab_update_entry_v1,

