From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 21 Jul 2004 08:14:09 +0000
Subject: [Kernel-janitors] Re: bluetooth: replace schedule_timeout() with
Message-Id: <1090397648.21683.51.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4064518864461471=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720184510.GA2445@masina>
In-Reply-To: <20040720184510.GA2445@masina>
To: kernel-janitors@vger.kernel.org

--===============4064518864461471==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nish,

> > > --- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
> > > +++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-10 18:22:58.000000000 +0000
> > > @@ -776,8 +776,7 @@ int bluecard_open(bluecard_info_t *info)
> > >  	outb(0x80, iobase + 0x30);
> > >  
> > >  	/* Wait some time */
> > > -	set_current_state(TASK_INTERRUPTIBLE);
> > > -	schedule_timeout(HZ / 100);
> > > +	msleep(100);
> > 
> > This should be 10.
> 
> Thanks, here is the corrected patch:

the patches are still wrong, because of warnings like this:

  CC [M]  drivers/bluetooth/bluecard_cs.o
drivers/bluetooth/bluecard_cs.c: In function `bluecard_open':
drivers/bluetooth/bluecard_cs.c:779: warning: implicit declaration of function `msleep'

I fixed these warnings and now I have to test if the cards are still working.

Regards

Marcel



--===============4064518864461471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4064518864461471==--
