From: Folkert van Heusden <folkert@vanheusden.com>
Date: Sun, 10 Dec 2006 21:39:26 +0000
Subject: Re: [KJ] strncpy optimalisation? (lib/string.c)
Message-Id: <20061210213925.GE30197@vanheusden.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061210205230.GB30197@vanheusden.com>
	<20061210210614.GD24090@1wt.eu>
	<20061210214934.GC47959@gaz.sfgoth.com>
In-Reply-To: <20061210214934.GC47959@gaz.sfgoth.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mitchell Blank Jr <mitch@sfgoth.com>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

> > Original code completely pads the destination with zeroes,
> > while yours only adds the last zero. Your code does what
> > strncpy() is said to do, but maybe there's a particular
> > reason for it to behave differently in the kernel
> No, the kernel's strncpy() behaves the same as the one in libc.  Run
> "man strncpy" if you don't believe me.
> In the common case where you just want to copy a string and avoid
> overflow use strlcpy() instead

Oops you're right! Maybe someone should take a look if the strncpy's
should be replaced by strlcpy's then because it is (ought to be) faster.


Folkert van Heusden

-- 
Ever wonder what is out there? Any alien races? Then please support
the seti@home project: setiathome.ssl.berkeley.edu
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
