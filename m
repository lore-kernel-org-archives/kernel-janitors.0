From: Adrian Bunk <bunk@stusta.de>
Date: Mon, 20 Dec 2004 00:13:16 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041220001315.GH21288@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31089937299596304=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============31089937299596304==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 19, 2004 at 08:09:03PM +0100, Andi Kleen wrote:
> 
> Here's a proposed janitor project if anybody is interested:
> 
> The current gcc 4.0 snapshots include some more warnings in -Wall
> and changed some existing ones which makes a kernel compilation quite noisy. 
> 
> The project would be to fix all these warnings.
>...
> You'll see lots of warnings in LOG. Fix them all and submit patches
> through the usual janitor channels.

What kind of new warnings does gcc 4.0 emit?

It should be checked whether the warnings are valid and should really be 
fixed.

A past example are the signed warnings pre-releases of gcc 3.3 
(including the pre-release a stable SuSE release shipped as compiler...) 
emitted with -Wall that were no longer emitted in the final gcc 3.3 
release.

Altogether, new warnings in gcc 4.0 might be a nice diagnostics for the 
people who are also trying to find bugs using -W, but I don't see urgent 
reasons for fixing them before gcc 4.0 is actually released.

> -Andi

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============31089937299596304==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31089937299596304==--
