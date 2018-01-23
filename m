From: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>
Date: Tue, 23 Jan 2018 20:37:52 +0000
Subject: [PATCH-next] powerpc/fsl_pci: Use PTR_ERR_OR_ZERO
Message-Id: <20180123203752.15057-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, joe@perches.com, christian.koenig@amd.com, tyreld@linux.vnet.ibm.com, konrad.wilk@oracle.com, robh@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher D=C3=ADaz Riveros <chrisadr@gentoo.org>
---
 arch/powerpc/sysdev/fsl_pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index cc20d2255d7f..142184635c81 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1304,10 +1304,7 @@ static int add_err_dev(struct platform_device *pdev)
 						   pdev->resource,
 						   pdev->num_resources,
 						   &pd, sizeof(pd));
-	if (IS_ERR(errdev))
-		return PTR_ERR(errdev);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(errdev);
 }
=20
 static int fsl_pci_probe(struct platform_device *pdev)
--=20
2.16.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
