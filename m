From: walter harms <wharms@bfs.de>
Date: Thu, 18 May 2006 15:19:17 +0000
Subject: [KJ] how to handle Kconfig ?
Message-Id: <446C9075.5040906@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
i was playing with 'make randconfig' and found that some issues are 
rooted in the kconfig selection.
e.g.:
you can select X86_NUMAQ without SMP what makes no sence since NUMAQ 
depends on SMP. (adding 'depends on SMP' helps).

Should that be fixed ? does anyone care ?

re,
  walter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
