From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sat, 25 Feb 2006 12:52:04 +0000
Subject: Re: [KJ] bonding/bond_main.c: check return value of
Message-Id: <9a8748490602250452k240c51fekdcf75609ff86659a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43E20B2F.8050109@bfs.de>
In-Reply-To: <43E20B2F.8050109@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/25/06, Tim Cooijmans <tim@aapopfiets.nl> wrote:
> On Saturday 25 February 2006 12:53, walter harms wrote:
> > +     res = register_netdevice_notifier(&bond_netdev_notifier);
> > +     if (res < 0) {
> > +             printk( KERN_ERR DRV_NAME" register_netdevice_notifier failed\n");
> > +
> > +             goto out_no_nd_notifier;
> > +     }
> > +
> > +
> >       register_inetaddr_notifier(&bond_inetaddr_notifier);
> I don't think there's a reason for that double newline.
>
I'd agree, and IMHO the one above the goto should go as well.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
