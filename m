From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 28 Feb 2006 21:39:43 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <20060228213943.GC7793@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77079747264765119=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============77079747264765119==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2006 at 09:51:53PM +0100, Jesper Juhl wrote:
> On 2/27/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > this patch converts drivers/usb to kzalloc usage.
> > Compile tested with allyes config.
> >
> > I think there was a bug in drivers/usb/gadget/inode.c because
> > it used sizeof(*data) for the kmalloc() and sizeof(data) for
> > the memset(), since sizeof(data) just returns the size for a pointer.
> >
> I don't know this code well, but looking briefly at it I'd say your
> analysis is correct and your patch fixes that bug.

That's what kernel janitors are for. Looking above and below mostly
trivial changes, noticing suspicious things.


--===============77079747264765119==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77079747264765119==--
