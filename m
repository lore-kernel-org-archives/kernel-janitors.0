From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 08 Oct 2005 22:17:06 +0000
Subject: Re: [KJ] [PATCH] Remove select_bits_alloc(), select_bits_free()
Message-Id: <20051008221706.GF24907@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20279414969949938=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
In-Reply-To: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============20279414969949938==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 07, 2005 at 06:59:11PM -0400, Arthur Othieno wrote:
> On Thu, Oct 06, 2005 at 07:20:16PM +0400, Alexey Dobriyan wrote:
> > * Both are trivial wrappers.
> > * Each wrapper is used only in one place.
>
> These managed to stay under you radar :)

Heh... Who greps for static functions? ;-)

> fs/compat.c:1597:static void *select_bits_alloc(int size)
> fs/compat.c:1602:static void select_bits_free(void *bits, int size)
> fs/compat.c:1666:	bits = select_bits_alloc(size);
> fs/compat.c:1712:	select_bits_free(bits, size);

So, 2 ways: remove all, consolidate. Opinions?


--===============20279414969949938==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20279414969949938==--
