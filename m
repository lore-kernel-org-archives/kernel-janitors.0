From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 28 Sep 2006 09:28:50 +0000
Subject: Re: [KJ] [PATCH] Check kmalloc() return value
Message-Id: <9a8748490609280228v31d030bj53e8a06fd76bda5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9a8748490609280141p49413782l66fd266aa076a877@mail.gmail.com>
In-Reply-To: <9a8748490609280141p49413782l66fd266aa076a877@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28/09/06, Galya Tcharny <gtcharny@gmail.com> wrote:
> On 9/28/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> > On 28/09/06, Galya Tcharny <gtcharny@gmail.com> wrote:
> > > Added checks for kmalloc() return value.
> > >
> > The patch also seems to be whitespace damaged somehow. Your lines are
> > not properly indented - at least not the copy my mail client gives me.
> >
>
> Thanks for your suggestions. Please find below fixed version.
> [snip]

> --- linux-2.6.18-orig/drivers/net/au1000_eth.c  2006-09-27
> 14:51:31.000000000 +0300

Your mail client still mangles the patch. The two lines above should
have been one line. Tell your mailer not to wordwrap lines.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
