From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 13:06:08 +0000
Subject: [PATCH 26/26] sgi-xp: constify local structures
Message-Id: <1473599168-30561-27-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cliff Whickman <cpw@sgi.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Robin Holt <robinmholt@gmail.com>, linux-kernel@vger.kernel.org

For structure types defined in the same file or local header files, find
top-level static structure declarations that have the following
properties:
1. Never reassigned.
2. Address never taken
3. Not passed to a top-level macro call
4. No pointer or array-typed field passed to a function or stored in a
variable.
Declare structures having all of these properties as const.

Done using Coccinelle.
Based on a suggestion by Joe Perches <joe@perches.com>.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch seems too long for a commit log, but is in the cover
letter.

 drivers/misc/sgi-xp/xpc_uv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 340b44d..f5fae21 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -1676,7 +1676,7 @@ xpc_received_payload_uv(struct xpc_channel *ch, void *payload)
 		XPC_DEACTIVATE_PARTITION(&xpc_partitions[ch->partid], ret);
 }
 
-static struct xpc_arch_operations xpc_arch_ops_uv = {
+static const struct xpc_arch_operations xpc_arch_ops_uv = {
 	.setup_partitions = xpc_setup_partitions_uv,
 	.teardown_partitions = xpc_teardown_partitions_uv,
 	.process_activate_IRQ_rcvd = xpc_process_activate_IRQ_rcvd_uv,

