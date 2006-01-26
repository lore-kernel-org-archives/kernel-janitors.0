From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 02:18:52 +0000
Subject: Re: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <1138241932.7930.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82058660083251178=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138233643.7232.45.camel@alice>
In-Reply-To: <1138233643.7232.45.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============82058660083251178==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

On Wed, 2006-01-25 at 18:01 -0800, Greg KH wrote:
> >  if BUG() is defined to nothing it still leaves the if, which must be optimized
> >  away by the compiler, not by the preprocessor
> 
> "gcc" is the compiler, not the preprocessor, like I stated :)
> 
> And gcc does this for you, have you looked?

Sure the end result is the same in both cases. But in one case the
preprocessor does the work, by replacing BUG_ON() with nothing,
and in the other case the compiler has to notice there is an empty
if statement.

> Anyway, these cleanups don't really change anything, at the code or
> assembly level, so I don't see the need for them...

I think it is much cleaner to read ( takes less screen space ), but i guess
there was a discussion like this already somewhen, at least the 
janitor.kernelnewbies.org/TODO states:

"make sure BUG() is used correctly (i.e. if(function()) BUG(); is evil)
  i.e. even when no-op-ing BUG we still have an if (See also: BUG_ON)"

In addition to this the BUG_ON define in asm-generic/bug.h also includes
an unlikely() which might generate better code.

Greetings, Eric



--===============82058660083251178==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82058660083251178==--
