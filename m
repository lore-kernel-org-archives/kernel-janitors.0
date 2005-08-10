From: Oliver Korpilla <Oliver.Korpilla@gmx.de>
Date: Wed, 10 Aug 2005 15:54:44 +0000
Subject: [KJ] Re: Log2 all through the kernel?
Message-Id: <1123689284.5437.10.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86676938197450459=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86676938197450459==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 10.08.2005, 16:23 +0300 schrieb Stauros Passas:
> Accurate logarithm algorithms are costly,and I don't think
> are needed from kernel developers, usually a approximation is enough.
> So if u want something realy accurate,
> u must look how it is implemented on libc.

No, I'm pretty find with a bit-shifted implementation - my question is:
Why is there not a single implementation that fits most people's needs?
The way log2 functions and macros are interpersed throughout the kernel
looks very spaghetti to me - everyone brewing his own one.

Wouldn't it be more sensible to supply one portable one, with bit
shifts, and people with a need for O(1) timing could implement it using
an array?

> The easiest(and fastest) way to compute a logarithm
> (with or without base 2) is to make bit shifts.
> 
> >
> > Is this desirable? While it may be some reduction for special cases using a 
> > table (like in the log2_2048 function I found - it computes only a certain of 
> > log2 and multiplies this with 2048), wouldn't a more generic implementation 
> > like ceil_log2 and floor_log2 not be desirable for all platforms?
> 
> U can simply use the functions of bitops.h (of asm-alpha) inline 
> functions, removing the alpha special comands:

Well, I could, but that is not quite my point. That would be a kernel
patch to just my kernel. 

Wouldn't it be more wise to supply a patch providing a single
implementation in the standard kernel and start converting most other
log2 implementations to that one? I don't have a good feeling with
everyone implementing the same, for really minimal gains.

You may say I'm more worried about software engineering practice than a
really quick solution. ;)

Thanks and with kind regards,
Oliver Korpilla


--===============86676938197450459==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86676938197450459==--
