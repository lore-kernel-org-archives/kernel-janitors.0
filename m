From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 11 Oct 2015 20:23:27 +0000
Subject: [PATCH] powerpc/numa: Use of_get_next_parent to simplify code
Message-Id: <1444595007-3029-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

of_get_next_parent can be used to simplify the while() loop and
avoid the need of a temp variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/mm/numa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8b9502a..b85d442 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -276,7 +276,6 @@ static int of_node_to_nid_single(struct device_node *device)
 /* Walk the device tree upwards, looking for an associativity id */
 int of_node_to_nid(struct device_node *device)
 {
-	struct device_node *tmp;
 	int nid = -1;
 
 	of_node_get(device);
@@ -285,9 +284,7 @@ int of_node_to_nid(struct device_node *device)
 		if (nid != -1)
 			break;
 
-	        tmp = device;
-		device = of_get_parent(tmp);
-		of_node_put(tmp);
+		device = of_get_next_parent(device);
 	}
 	of_node_put(device);
 
-- 
2.1.4

