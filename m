From: Andi Kleen <ak@muc.de>
Date: Sun, 19 Dec 2004 20:03:24 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041219200324.GA44435@muc.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66395528106330126=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============66395528106330126==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 19, 2004 at 07:47:59PM +0000, Matthew Wilcox wrote:
> On Sun, Dec 19, 2004 at 08:09:03PM +0100, Andi Kleen wrote:
> > Here's a proposed janitor project if anybody is interested:
> > 
> > The current gcc 4.0 snapshots include some more warnings in -Wall
> > and changed some existing ones which makes a kernel compilation quite noisy. 
> 
> I think it would get more takers if people didn't have to compile a new
> gcc.  If we had a list of -W... flags in older gccs that could simulate
> 90% of the warnings, this would make it possible for more people to work
> on it.

Problem is that some of the warnings are completely new in gcc 4 and
cannot be enabled with options in older versions. Also with a reasonable
modern machine (Athlon or P4) it won't take that long to do the gcc
compilation.

-Andi

--===============66395528106330126==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66395528106330126==--
