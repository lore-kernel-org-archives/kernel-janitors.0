From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Tue, 11 Jan 2005 04:10:23 +0000
Subject: Re: [KJ] Re: [UPDATE PATCH] net/sb1000: replace nicedelay() with
Message-Id: <29495f1d0501102010531fa775@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============067766431185619203=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
	 <20050111003908.GJ9186@us.ibm.com> <41E34E6F.70002@pobox.com>
In-Reply-To: <41E34E6F.70002@pobox.com>
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Nishanth Aravamudan <nacc@us.ibm.com>, kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============067766431185619203==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Jan 2005 22:56:31 -0500, Jeff Garzik <jgarzik@pobox.com> wrote:
> Nishanth Aravamudan wrote:
> > @@ -475,7 +467,7 @@ sb1000_reset(const int ioaddr[], const c
> >       udelay(1000);
> >       outb(0x0, port);
> >       inb(port);
> > -     nicedelay(60000);
> > +     ssleep(1);
> >       outb(0x4, port);
> >       inb(port);
> >       udelay(1000);
> > @@ -537,7 +529,7 @@ sb1000_activate(const int ioaddr[], cons
> >       const unsigned char Command0[6] = {0x80, 0x11, 0x00, 0x00, 0x00, 0x00};
> >       const unsigned char Command1[6] = {0x80, 0x16, 0x00, 0x00, 0x00, 0x00};
> >
> > -     nicedelay(50000);
> > +     ssleep(1);
> >       if ((status = card_send_command(ioaddr, name, Command0, st)))
> >               return status;
> >       if ((status = card_send_command(ioaddr, name, Command1, st)))
> > @@ -944,7 +936,7 @@ sb1000_open(struct net_device *dev)
> >       /* initialize sb1000 */
> >       if ((status = sb1000_reset(ioaddr, name)))
> >               return status;
> > -     nicedelay(200000);
> > +     ssleep(1);
> >       if ((status = sb1000_check_CRC(ioaddr, name)))
> >               return status;
> 
> 
> Your conversion of nicedelay() -> ssleep() values is imprecise.

True, but this is what I attempted to allude to in the description of the patch:

> > Remove the prototype and
> > definition of nicedelay(). This is a very weird function, because it is
> > called to sleep in terms of usecs, but always sleeps for 1 second,
> > completely ignoring the parameter. I have gone ahead and followed suit,
> > just sleeping for a second in all cases, but maybe someone with the
> > hardware could tell me if perhaps the paramter *should* matter.

> The author clearly intended the values to be different, right?

Since I'm not the author, I'm not certain whether you are right or
not. I was honestly very confused by nicedelay(). It is called with
various 600000, 500000, 200000 usecs, but the function currently
always requests a 1000000 usec delay (a full second of interruptible
sleep). It just doesn't make any sense... I have sent messages
regarding this function several times (and patches have existed for a
while), but no one has had any comment. I appreciate your input
greatly. What do you think?

Thanks,
Nish

--===============067766431185619203==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============067766431185619203==--
