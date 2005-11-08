From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 19:21:03 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <4370FA9F.6010800@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com> <52mzkfrily.fsf@cisco.com> <Pine.LNX.4.62.0511081049520.30907@schroedinger.engr.sgi.com> <4370F6BB.1070409@us.ibm.com> <Pine.LNX.4.62.0511081108340.31060@schroedinger.engr.sgi.com>
In-Reply-To: <Pine.LNX.4.62.0511081108340.31060@schroedinger.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <clameter@engr.sgi.com>
Cc: Roland Dreier <rolandd@cisco.com>, kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org, manfred@colorfullife.com

Christoph Lameter wrote:
> On Tue, 8 Nov 2005, Matthew Dobson wrote:
> 
> 
>>>A large object in terms of this patch is a object greater than 4096 bytes 
>>>not an object greater than PAGE_SIZE. I think the absolute size is 
>>>desired.
>>
>>Would you be OK with at least NAMING the constant?  I won't name it
>>PAGE_SIZE (of course), but LARGE_OBJECT_SIZE or something?
> 
> 
> Ask Manfred about this. I think he coded it that way and he usually has 
> good reasons for it.
> 
> Thanks for the cleanup work!

Manfred, any reason not to name this constant in slab.c?  If there's a good
reason not to, I'm perfectly happy to leave it alone. :)

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
