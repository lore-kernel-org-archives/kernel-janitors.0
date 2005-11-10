From: Matthew Dobson <colpatch@us.ibm.com>
Date: Thu, 10 Nov 2005 23:53:38 +0000
Subject: [KJ] [PATCH 0/9] Cleanup mm/slab.c v2
Message-Id: <4373DD82.8010606@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: manfred@colorfullife.com, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

Second take at cleaning up mm/slab.c.  Patch series has picked up 2 new
patches and dropped one old one.  The 2 new patches create new helper
functions, and I've dropped the patch to inline 3 functions after it was
deemed unecessary.

Appologies for the delay in getting version 2 out.  /me is easily
distracted by shiny things.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
