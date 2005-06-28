From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 28 Jun 2005 15:41:22 +0000
Subject: Re: [KJ] typo?
Message-Id: <20050628154122.GA5125@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11092676591506145=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050628141624.GA6647@ngolde.de>
In-Reply-To: <20050628141624.GA6647@ngolde.de>
To: kernel-janitors@vger.kernel.org

--===============11092676591506145==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 28 Jun 2005, Nico Golde wrote:

> Hello Matthew,
> 
> * Matthew Wilcox <matthew@wil.cx> [2005-06-28 16:41]:
> > On Tue, Jun 28, 2005 at 04:16:25PM +0200, Nico Golde wrote:
> > > Hi,
> > > do you think that:
> > > printk(KERN_EMERG "Press L1-A to return to the boot prom\n")
> > > is a typo?
> > 
> > On Sparc, no.  What do you think is a typo about it?
> 
> I thought it is because if I understood boot prom correctly
> it is something which has to do with networking and booting.
> But here a user interaction is meant (because of the press)
> and in my opinion this part of the panic code has nothing to
> do with networking.
>     regards nico

please use more recent sources.
for people not used to sparc the message got really improved:
                printk(KERN_EMERG "Press Stop-A (L8-A) to return to the boot prom\n");
remember my first time glaring at it. :)

anyway if you aren't exposed to sparc you could ignore code inside of
#ifdef __sparc__

--
maks

--===============11092676591506145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11092676591506145==--
