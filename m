From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Aug 2017 13:24:23 +0000
Subject: [PATCH] powerpc: store the intended structure
Message-Id: <1502630663-18599-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Normally the values in the resource field and the argument to ARRAY_SIZE
in the num_resources are the same.  In this case, the value in the reousrce
field is the same as the one in the previous platform_device structure, and
appears to be a copy-paste error.  Replace the value in the resource field
with the argument to the local call to ARRAY_SIZE.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/powerpc/platforms/chrp/pegasos_eth.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/chrp/pegasos_eth.c b/arch/powerpc/platforms/chrp/pegasos_eth.c
index 2b4dc6a..1976071 100644
--- a/arch/powerpc/platforms/chrp/pegasos_eth.c
+++ b/arch/powerpc/platforms/chrp/pegasos_eth.c
@@ -63,7 +63,7 @@
 	.name		= "orion-mdio",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(mv643xx_eth_mvmdio_resources),
-	.resource	= mv643xx_eth_shared_resources,
+	.resource	= mv643xx_eth_mvmdio_resources,
 };
 
 static struct resource mv643xx_eth_port1_resources[] = {

