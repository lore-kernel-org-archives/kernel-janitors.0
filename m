From: Joe Perches <joe@perches.com>
Date: Tue, 29 Jan 2013 16:13:18 +0000
Subject: coccinelle and bitmask arithmetic (was: Re: [patch] TTY: synclink, small cleanup in dtr_rts())
Message-Id: <1359475998.4196.26.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
In-Reply-To: <9561.1359474916@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Tue, 2013-01-29 at 10:55 -0500, Valdis.Kletnieks@vt.edu wrote:
> On Sun, 27 Jan 2013 23:19:47 +0300, Dan Carpenter said:
> 
> > Yeah.  I think it would be, but adding bitflags together instead of
> > doing bitwise ORs is very common as well.
> 
> The fact it's common doesn't mean it's good programming practice,
> or even correct.  Consider:
> 
> #define F_FOO 0x01
> #define F_BAR 0x02
> #define F_BAZ 0x04
> 
> unsigned int flags = F_FOO;
> ...
>       flags |= F_BAR;
> 
> Now some time later, another code path does this:
> 
>       flags += F_FOO;
> 
> If it was another |, it would be a no harm no foul class of bug.
> But how long is it going to take you to figure out who set F_BAZ?
> 
> I wonder if there's a way to write a coccinelle patch to find places
> where we do arithmetic operations on bitmasks....

Not so far as I know, but maybe someone on the
cocci lists does. (cc'd)

I could imagine a test for variables that have
uses of both arithmetic and bit operations but
not a discriminator for when one type is
appropriate and the other is not.


