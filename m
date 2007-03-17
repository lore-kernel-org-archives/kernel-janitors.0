From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 17 Mar 2007 21:55:02 +0000
Subject: Re: [KJ] is there a kernel standard for assertions?
Message-Id: <200703172255.02494.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Saturday 17 March 2007 22:46:39 Robert P. J. Day wrote:
> i'm aware of both of those macros, which is why i'm wondering why so
> many developers insist on inventing their own version of an "assert"
> routine. =A0given all of the *existing* debugging routines, shouldn't
> inventing your own be discouraged? =A0is that something that could be
> turned into a KJ project of some kind?

Yes. I guess most of the assert() implementations in the kernel are
older than BUG_ON() and WARN_ON(). Adding new ones is normally
discouraged.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
