From: Manfred Spraul <manfred@colorfullife.com>
Date: Tue, 08 Nov 2005 19:59:55 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <437103BB.2000209@colorfullife.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com> <52mzkfrily.fsf@cisco.com> <Pine.LNX.4.62.0511081049520.30907@schroedinger.engr.sgi.com> <4370F6BB.1070409@us.ibm.com> <Pine.LNX.4.62.0511081108340.31060@schroedinger.engr.sgi.com> <4370FA9F.6010800@us.ibm.com>
In-Reply-To: <4370FA9F.6010800@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: Christoph Lameter <clameter@engr.sgi.com>, Roland Dreier <rolandd@cisco.com>, kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

Matthew Dobson wrote:

>Manfred, any reason not to name this constant in slab.c?  If there's a good
>reason not to, I'm perfectly happy to leave it alone. :)
>
>  
>
No, there is no reason. It's debug-only code, thus I was too lazy to 
create a constant.

And no - don't make me maintainer of slab.c. I didn't even have enough 
time to review the numa patches properly.

--
    Manfred
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
