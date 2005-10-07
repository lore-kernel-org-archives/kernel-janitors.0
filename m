From: a.othieno@bluewin.ch (Arthur Othieno)
Date: Fri, 07 Oct 2005 22:59:11 +0000
Subject: Re: [KJ] [PATCH] Remove select_bits_alloc(), select_bits_free()
Message-Id: <20051007225911.GB11630@mars>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57357480968507701=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
In-Reply-To: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============57357480968507701==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 06, 2005 at 07:20:16PM +0400, Alexey Dobriyan wrote:
> * Both are trivial wrappers.
> * Each wrapper is used only in one place.

These managed to stay under you radar :)

fs/compat.c:1597:static void *select_bits_alloc(int size)
fs/compat.c:1602:static void select_bits_free(void *bits, int size)
fs/compat.c:1666:	bits = select_bits_alloc(size);
fs/compat.c:1712:	select_bits_free(bits, size);

Also, comment above select_bits_alloc() definition needs relocation to
right above compat_sys_select().

	Arthur

--===============57357480968507701==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57357480968507701==--
