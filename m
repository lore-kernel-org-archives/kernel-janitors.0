From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 19:08:30 +0000
Subject: [KJ] Re: [PATCH 8/8] Inline 3 functions
Message-Id: <4370F7AE.5090505@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF894.8090204@us.ibm.com> <Pine.LNX.4.58.0511080937060.9530@sbz-30.cs.Helsinki.FI>
In-Reply-To: <Pine.LNX.4.58.0511080937060.9530@sbz-30.cs.Helsinki.FI>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Pekka J Enberg wrote:
> On Mon, 7 Nov 2005, Matthew Dobson wrote:
> 
>>I found three functions in slab.c that have only 1 caller (kmem_getpages,
>>alloc_slabmgmt, and set_slab_attr), so let's inline them.
> 
> 
> Why? They aren't on the hot path and I don't see how this is an 
> improvement...
> 
> 			Pekka

Well, no, they aren't on the hot path.  I just figured since they are only
ever called from one other function, why not inline them?  If the sentiment
is that it's a BAD idea, I'll drop it.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
