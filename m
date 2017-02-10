From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 10 Feb 2017 19:45:05 +0000
Subject: [PATCH v2] powerpc/pseries: Fix missing of_node_put
Message-Id: <20170210194505.8236-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, jallen@linux.vnet.ibm.com, nfont@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dlpar_configure_connector()' fails, 'parent_dn' should be released.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Reorder code in order to simplify the proposed patch
---
 arch/powerpc/platforms/pseries/mobility.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 5a0c7ba429ce..2f8be51f5fd0 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -226,6 +226,7 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 		return -ENOENT;
 
 	dn = dlpar_configure_connector(drc_index, parent_dn);
+	of_node_put(parent_dn);
 	if (!dn)
 		return -ENOENT;
 
@@ -233,7 +234,6 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 	if (rc)
 		dlpar_free_cc_nodes(dn);
 
-	of_node_put(parent_dn);
 	return rc;
 }
 
-- 
2.9.3

