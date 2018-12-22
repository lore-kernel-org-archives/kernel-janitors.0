From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 12:49:39 +0000
Subject: [PATCH] drivers: base: swnode: check if pointer p is null before dereferencing it
Message-Id: <20181222124939.13744-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer p can be potentially null macro to_software_node can return
null.  Add null check on p before dereferencing it to avoid any null
pointer dereferences.

Detected by CoverityScan, CID#1476039 ("Explicit null dereferenced")

Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 204aa7d049e0..89ad8dee6ad5 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -488,7 +488,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
 	struct software_node *p = to_software_node(fwnode);
 	struct software_node *c = to_software_node(child);
 
-	if (list_empty(&p->children) ||
+	if (!p || list_empty(&p->children) ||
 	    (c && list_is_last(&c->entry, &p->children)))
 		return NULL;
 
-- 
2.19.1
