From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 16:06:18 +0000
Subject: [Kernel-janitors] Re: bluetooth: replace schedule_timeout() with
Message-Id: <20040721160618.GA1906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12510129178301721=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720184510.GA2445@masina>
In-Reply-To: <20040720184510.GA2445@masina>
To: kernel-janitors@vger.kernel.org

--===============12510129178301721==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2004 at 10:14:09AM +0200, Marcel Holtmann wrote:
> > > > --- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
> > > > +++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-10 18:22:58.000000000 +0000
> > > > @@ -776,8 +776,7 @@ int bluecard_open(bluecard_info_t *info)
> > > >  	outb(0x80, iobase + 0x30);
> > > >  
> > > >  	/* Wait some time */
> > > > -	set_current_state(TASK_INTERRUPTIBLE);
> > > > -	schedule_timeout(HZ / 100);
> > > > +	msleep(100);
> > > 
> > > This should be 10.
> > 
> > Thanks, here is the corrected patch:
> 
> the patches are still wrong, because of warnings like this:
> 
>   CC [M]  drivers/bluetooth/bluecard_cs.o
> drivers/bluetooth/bluecard_cs.c: In function `bluecard_open':
> drivers/bluetooth/bluecard_cs.c:779: warning: implicit declaration of function `msleep'
> 
> I fixed these warnings and now I have to test if the cards are still working.

Thank you for notifying me of this. I thought I had caught all of these
compile errors, but will now go back through and make sure before I
release any more patches. Sorry for the inconvenience, but I'm learning.

-Nish

--===============12510129178301721==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12510129178301721==--
