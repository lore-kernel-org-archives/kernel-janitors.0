From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 11 Feb 2005 00:59:11 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <420C035F.6090701@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Stephen Biggs wrote:
> Greetings,
> 
> This will be my first attempt at submitting a patch, so please be 
> reasonably gentle with me :-)  I have tried to comply with all that I 
> have read, but I most likely missed something.
> 
> I attach 3 files in text/plain Ascii format; I think I understood the 
> FAQ correctly that this is the right way to do things?

Inline (in text/body) is certainly better in the kernel world,
but some email clients make that difficult.

> The warnings that remain are mostly of the "deprecated" type for pm_* 
> type warnings that I need guidence on what to do about, since I was not 
> able to find any definitive guide to converting a driver with 2.4 style 
> power management to 2.6 style power management. Thus, I left these alone. 
>  I have not seen too much traffic about this on either the kernel-
> janitors list or lkml, so this would be open territory.  Any help on this 
> would be appreciated.

You might be able to find the answer to this in the linux power 
management mailing list archives, here:
http://lists.osdl.org/pipermail/linux-pm/

> The rest of the warnings left are: deprecated for inter_module_* 
> functions which seems to be already a topic of discussion in lkml (or 
> was),
Yes, the graphics people are working on that one AFAIK.

> The third attachment to this post is the patch itself.  Please let me 
> know if this comes through ok... 

Patch comments, hope I'm not duplicating:

1.  +  if(user_copy_err) {

space between "if" and '('   [multiple]

2.  +  if ( !user_copy_err && offset )

but no space after '(' or before ')'        [picky, eh?]

3.  sx8.c is already patched (maybe Adrian said this)

4.  		writew(tf->feature | (((u16)tf->hob_feature) << 8), (volatile 
void __iomem *)ioaddr->feature_addr);

This line (and others) is just too long.  Split it up at the comma
between the first & second parameters and then indent the second
line.


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
