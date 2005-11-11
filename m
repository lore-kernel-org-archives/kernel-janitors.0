From: Matthew Dobson <colpatch@us.ibm.com>
Date: Fri, 11 Nov 2005 18:28:41 +0000
Subject: [KJ] Re: [PATCH 6/9] Cleanup kmem_cache_create()
Message-Id: <4374E2D9.3020304@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DD82.8010606@us.ibm.com> <4373E011.9070508@us.ibm.com> <200511110910.38350.ioe-lkml@rameria.de>
In-Reply-To: <200511110910.38350.ioe-lkml@rameria.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Oeser <ioe-lkml@rameria.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, manfred@colorfullife.com, Pekka J Enberg <penberg@cs.helsinki.fi>

Ingo Oeser wrote:
> On Friday 11 November 2005 01:04, Matthew Dobson wrote:
> 
>>- if (size < 4096 || fls(size - 1) = fls(size - 1 + 3 * BYTES_PER_WORD))
>>+ if (size < RED_ZONE_LIMIT ||
>>+	fls(size - 1) = fls(size - 1 + 3 * BYTES_PER_WORD))
>>             flags |= SLAB_RED_ZONE|SLAB_STORE_USER;
> 
> 
> I would suggest sth. like
> 
> if (size < RED_TONE_LIMIT
>     || fls(size - 1) = fls(size - 1 + 3 * BYTES_PER_WORD))
> 	flags |= SLAB_RED_ZONE | SLAB_STORE_USER
> 
> 
> Reason: A binary operator in front is a huge hint 
> 	that this is a continued line.
> 
> Just compare when you go to a store next time.
> 
> 	1
> +	2
> -	3
> *	4
> 
> is much more readable then
> 
> 1	+
> 2	-
> 3	*
> 4
> 
> right?
> 
> 
> Regards
> 
> Ingo Oeser

You make a very good point.  It's not the way that I'm used to writing
multi-line ifs, but it is a bit more readable.  However, since the rest of
the multi-line ifs in the file have the binary operator at the end of the
first line, I'm inclined to leave it the way it is for consistency.  If
anyone really feels strongly, I could come up with a patch for the whole
file...?

Thanks for the feedback!

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
