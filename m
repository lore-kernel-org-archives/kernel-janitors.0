From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Feb 2017 21:36:16 +0000
Subject: [PATCH] powerpc/pseries: Fix missing of_node_put
Message-Id: <20170206213616.3661-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, nfont@linux.vnet.ibm.com, jallen@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dlpar_configure_connector()' fails, 'parent_dn' should be released as
already done in the normal case.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/platforms/pseries/mobility.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 5a0c7ba429ce..b8060c182ae2 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -226,13 +226,16 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 		return -ENOENT;
 
 	dn = dlpar_configure_connector(drc_index, parent_dn);
-	if (!dn)
-		return -ENOENT;
+	if (!dn) {
+		rc = -ENOENT;
+		goto out;
+	}
 
 	rc = dlpar_attach_node(dn);
 	if (rc)
 		dlpar_free_cc_nodes(dn);
 
+out:
 	of_node_put(parent_dn);
 	return rc;
 }
-- 
2.9.3

