From: Bernd Petrovitsch <bernd@firmix.at>
Date: Sun, 10 Dec 2006 23:28:45 +0000
Subject: Re: [KJ] strncpy optimalisation? (lib/string.c)
Message-Id: <1165793325.8998.10.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061210205230.GB30197@vanheusden.com>
	 <20061210210614.GD24090@1wt.eu> <20061210214934.GC47959@gaz.sfgoth.com>
	 <20061210213925.GE30197@vanheusden.com>
In-Reply-To: <20061210213925.GE30197@vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: Mitchell Blank Jr <mitch@sfgoth.com>, Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Sun, 2006-12-10 at 22:39 +0100, Folkert van Heusden wrote:
> > > Original code completely pads the destination with zeroes,
> > > while yours only adds the last zero. Your code does what
> > > strncpy() is said to do, but maybe there's a particular
> > > reason for it to behave differently in the kernel
> > No, the kernel's strncpy() behaves the same as the one in libc.  Run
> > "man strncpy" if you don't believe me.
> > In the common case where you just want to copy a string and avoid
> > overflow use strlcpy() instead
> 
> Oops you're right! Maybe someone should take a look if the strncpy's
> should be replaced by strlcpy's then because it is (ought to be) faster.

The last time some folks did this (quite automatically) ended in newly
introduced bugs leaking old/stale data from kernel top user space. Alan
Cox went over it (again) and fixed those broken "optimizations".

So whoever wants to do this, look for such issues too.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
