From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 18:49:42 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <4370F346.7020601@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com> <52mzkfrily.fsf@cisco.com> <Pine.LNX.4.58.0511080932460.9530@sbz-30.cs.Helsinki.FI>
In-Reply-To: <Pine.LNX.4.58.0511080932460.9530@sbz-30.cs.Helsinki.FI>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Roland Dreier <rolandd@cisco.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Pekka J Enberg wrote:
> On Mon, 7 Nov 2005, Roland Dreier wrote:
> 
> 
>>    > * Replace a constant (4096) with what it represents (PAGE_SIZE)
>>
>>This seems dangerous.  I don't pretend to understand the slab code,
>>but the current code works on architectures with PAGE_SIZE != 4096.
>>Are you sure this change is correct?
> 
> 
> Looks ok to me except that it should be a separate patch (it is not a 
> trivial cleanup because it changes how the code works).
> 
> 			Pekka

That's very reasonable, Pekka.  I will respin 4/8 without that change and
add a 9/8 that is JUST that one change.

Thank you both for the review and comments!

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
