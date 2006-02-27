From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 27 Feb 2006 20:51:53 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <9a8748490602271251ya5ac638pc828550d7719980e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/27/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> hi,
>
> this patch converts drivers/usb to kzalloc usage.
> Compile tested with allyes config.
>
> I think there was a bug in drivers/usb/gadget/inode.c because
> it used sizeof(*data) for the kmalloc() and sizeof(data) for
> the memset(), since sizeof(data) just returns the size for a pointer.
>
I don't know this code well, but looking briefly at it I'd say your
analysis is correct and your patch fixes that bug.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
