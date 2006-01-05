From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 05 Jan 2006 10:32:31 +0000
Subject: Re: [KJ] [PATCH] Deinitialise static variables in net/core/pktgen.c
Message-Id: <20060105103231.GA24890@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65033403568341974=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <17299.192.96.150.57.1135065563.squirrel@mail.interexcel.co.za>
In-Reply-To: <17299.192.96.150.57.1135065563.squirrel@mail.interexcel.co.za>
To: kernel-janitors@vger.kernel.org

--===============65033403568341974==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 28, 2005 at 09:39:38PM +0000, Arnd Bergmann wrote:

[static, .data, .bss]

> Can we please remove this item from the janitor todo list?
> Most distro-supplied compilers (gcc versions 3.4 or later)
> do this automatically, so there is very little gain in this
> (if there ever was -- we're only talking about object file
> size here anyway, not memory consumption).

Agree. When I tried to do something like this in module code, Rusty NAKed
it on readability grounds.

revision 1.44
date: 2006/01/05 10:10:11;  author: dobriyan;  state: Exp;  lines: +1 -4
Remove "static int foo = 0;" item. gcc should be smart enough.


--===============65033403568341974==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65033403568341974==--
