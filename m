From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Feb 2015 13:00:51 +0000
Subject: [PATCH] PowerPC-PCI: Delete unnecessary checks before the function call "kfree"
Message-Id: <54D0C683.70501@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, cbe-oss-dev@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Feb 2015 13:55:53 +0100

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/cell/celleb_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/cell/celleb_pci.c b/arch/powerpc/platforms/cell/celleb_pci.c
index 3ce70de..9b11b5d 100644
--- a/arch/powerpc/platforms/cell/celleb_pci.c
+++ b/arch/powerpc/platforms/cell/celleb_pci.c
@@ -393,11 +393,10 @@ static int __init celleb_setup_fake_pci_device(struct device_node *node,
 
 error:
 	if (mem_init_done) {
-		if (config && *config)
+		if (config)
 			kfree(*config);
-		if (res && *res)
+		if (res)
 			kfree(*res);
-
 	} else {
 		if (config && *config) {
 			size = 256;
-- 
2.2.2

