From: Andi Kleen <ak@muc.de>
Date: Mon, 20 Dec 2004 08:03:10 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041220080310.GA47521@muc.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47998685391626172=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============47998685391626172==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2004 at 01:13:16AM +0100, Adrian Bunk wrote:
> > You'll see lots of warnings in LOG. Fix them all and submit patches
> > through the usual janitor channels.
> 
> What kind of new warnings does gcc 4.0 emit?

http://www.firstfloor.org/~andi/2.6.10rc2-gcc4-warnings.gz has a full
list from i386 allmodconfig (including some errors) 

> Altogether, new warnings in gcc 4.0 might be a nice diagnostics for the 
> people who are also trying to find bugs using -W, but I don't see urgent 
> reasons for fixing them before gcc 4.0 is actually released.

I disagree. It's better to have the kernel already gcc 4 ready when it is 
released. And we always ask other people to test mainline kernels, so 
it's only fair to test and use other people's mainline code too.

-Andi

--===============47998685391626172==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47998685391626172==--
