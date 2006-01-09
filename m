From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Mon, 09 Jan 2006 19:02:19 +0000
Subject: Re: [KJ] linux-2.6.15-rc7/drivers/pci/syscall.c
Message-Id: <9a8748490601091102t78383df3y5f3c0e09a15d3d2d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091138.03704.cneira@srb.cl>
In-Reply-To: <200601091138.03704.cneira@srb.cl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/9/06, Greg KH <greg@kroah.com> wrote:
> On Mon, Jan 09, 2006 at 11:38:03AM +0000, carlos neira wrote:
> > Greetings :
> >
> > patch :linux-2.6.15-rc7/drivers/pci/syscall.c
> >
> > replaced a  lock_kernel with spinlocks  , compile tested ok
>
> What arch did you compile this for?
>
> And why remove the lock_kernel calls here, are they hurting anything?
>
I can't comment on the specific patch, but in general I thought we
wanted to get rid of lock_kernel() / unlock_kernel() over time?  If
that is indeed the case, then patches like this one are a step in the
right direction - no?

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
