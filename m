From: Nicolas Palix <npalix@diku.dk>
Date: Wed, 03 Dec 2008 10:25:03 +0000
Subject: Re: [PATCH] powerpc/powermac: Add missing of_node_put
Message-Id: <200812031125.03478.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021445.18670.npalix@diku.dk>
	<20081203101901.4f317425.sfr@canb.auug.org.au>
	<20081203102508.ce955781.sfr@canb.auug.org.au>
In-Reply-To: <20081203102508.ce955781.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, paulus@samba.org

Hi Stephen,

I fix the patch. I also change the "vias = 0" in "vias = NULL".
Is "!vias" better ?

On Wednesday 03 December 2008 00:25:08 Stephen Rothwell wrote:
> Hi Nicolas,
> 
> On Wed, 3 Dec 2008 10:19:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I think this particular patch is also required against Linus' kernel (not
> > just linux-next).
> 
> In fact, I think all these patches can apply to Linus' current tree.
> 
Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 arch/powerpc/platforms/powermac/pci.c  |    2 +
 arch/powerpc/platforms/powermac/time.c |   11 ++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index bcf50d7..800fcce 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -661,6 +661,7 @@ static void __init init_second_ohare(void)
 			pci_find_hose_for_OF_device(np);
 		if (!hose) {
 			printk(KERN_ERR "Can't find PCI hose for OHare2 !\n");
+			of_node_put(np);
 			return;
 		}
 		early_read_config_word(hose, bus, devfn, PCI_COMMAND, &cmd);
@@ -669,6 +670,7 @@ static void __init init_second_ohare(void)
 		early_write_config_word(hose, bus, devfn, PCI_COMMAND, cmd);
 	}
 	has_second_ohare = 1;
+	of_node_put(np);
 }
 
 /*
diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 59eb840..1810e42 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -265,12 +265,15 @@ int __init via_calibrate_decr(void)
 	struct resource rsrc;
 
 	vias = of_find_node_by_name(NULL, "via-cuda");
-	if (vias = 0)
+	if (vias = NULL)
 		vias = of_find_node_by_name(NULL, "via-pmu");
-	if (vias = 0)
+	if (vias = NULL)
 		vias = of_find_node_by_name(NULL, "via");
-	if (vias = 0 || of_address_to_resource(vias, 0, &rsrc))
+	if (vias = NULL || of_address_to_resource(vias, 0, &rsrc)) {
+	        of_node_put(vias);
 		return 0;
+	}
+	of_node_put(vias);
 	via = ioremap(rsrc.start, rsrc.end - rsrc.start + 1);
 	if (via = NULL) {
 		printk(KERN_ERR "Failed to map VIA for timer calibration !\n");
@@ -297,7 +300,7 @@ int __init via_calibrate_decr(void)
 	ppc_tb_freq = (dstart - dend) * 100 / 6;
 
 	iounmap(via);
-	
+
 	return 1;
 }
 #endif
-- 
Nicolas Palix
