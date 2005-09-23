From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 10:40:00 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/smc37c93x.c
Message-Id: <20050923104000.GK10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43980039835366735=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============43980039835366735==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.14-rc2/arch/alpha/kernel/smc37c93x.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/smc37c93x.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/smc37c93x.c
@@ -265,7 +265,7 @@ int __init SMC93x_Init(void)
 #endif
 		SMCRunState(SMCUltraBase);
 		local_irq_restore(flags);
-		printk("SMC FDC37C93X Ultra I/O Controller found @ 0x%lx\n",
+		printk(KERN_INFO "SMC FDC37C93X Ultra I/O Controller found @ 0x%lx\n",
 		       SMCUltraBase);
 		return 1;
 	}


--===============43980039835366735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43980039835366735==--
