From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 28 Feb 2006 21:49:59 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <9a8748490602281349j5dfeb806l20c19f9f1a9e10f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/28/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Mon, Feb 27, 2006 at 09:51:53PM +0100, Jesper Juhl wrote:
> > On 2/27/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > > this patch converts drivers/usb to kzalloc usage.
> > > Compile tested with allyes config.
> > >
> > > I think there was a bug in drivers/usb/gadget/inode.c because
> > > it used sizeof(*data) for the kmalloc() and sizeof(data) for
> > > the memset(), since sizeof(data) just returns the size for a pointer.
> > >
> > I don't know this code well, but looking briefly at it I'd say your
> > analysis is correct and your patch fixes that bug.
>
> That's what kernel janitors are for. Looking above and below mostly
> trivial changes, noticing suspicious things.
>

Yes, and that's exactely why I geve Eric some feedback when I had read
his patch. To let him know that at least one other person had looked
at the work he had done and thought it looked good.

I'm sorry, but I don't really know what the intention of your comment was...?

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
