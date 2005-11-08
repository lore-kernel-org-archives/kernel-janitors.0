From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 18:59:43 +0000
Subject: Re: [KJ] [PATCH 7/8] Cleanup set_slab_attr()
Message-Id: <4370F59F.9080504@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF82E.1050004@us.ibm.com>
In-Reply-To: <436FF82E.1050004@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

walter harms wrote:
> 
> hi Matthew,
> a for() loop is easier to understand (for me).
> 
> page = virt_to_page(objp);
> 
> for(i=0;i< (1 << cachep->gfporder);i++)
> {
>     SET_PAGE_CACHE(page, cachep);
>       SET_PAGE_SLAB(page, slabp);
>       page++;
> }
> 
> re,
>     walter

I think so too, but there are a number of other loops in this file that do
essentially the same thing, but are coded as while (i--) {} loops.  If
people want, I can change all of them to for() loops, but such a change is
more invasive and I would want acknowledgement that people would want such
a change first.

Thanks for the feedback,

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
