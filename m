From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 00:45:17 +0000
Subject: [KJ] [PATCH 0/8] Cleanup slab.c
Message-Id: <436FF51D.8080509@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

Since there was some (albeit very brief) discussion last week about the
need to cleanup mm/slab.c, I figured I'd post these patches.  I was
inspired to cleanup mm/slab.c since I'm working on a project (to be posted
shortly) that touched a bunch of slab code.  I found slab.c to be
inconsistent, to say the least.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
