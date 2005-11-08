From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 19:09:14 +0000
Subject: Re: [KJ] [PATCH 6/8] Cleanup slabinfo_write()
Message-Id: <4370F7DA.5000307@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF7F7.1060907@us.ibm.com> <20051108105013.GA7678@mipter.zuzino.mipt.ru> <Pine.LNX.4.62.0511081055430.30907@schroedinger.engr.sgi.com>
In-Reply-To: <Pine.LNX.4.62.0511081055430.30907@schroedinger.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <clameter@engr.sgi.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

Christoph Lameter wrote:
> On Tue, 8 Nov 2005, Alexey Dobriyan wrote:
> 
> 
>>On Mon, Nov 07, 2005 at 04:57:27PM -0800, Matthew Dobson wrote:
>>
>>>* Set 'res' at declaration instead of later in the function.
>>
>>I hate to initialize a varible two miles away from the place where it's
>>used.
> 
> 
>  
> 
>>>-	int limit, batchcount, shared, res;
>>>+	int limit, batchcount, shared, res = -EINVAL;
> 
> 
> Looks more confusing than before.

Fair enough.  I'll drop that bit.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
