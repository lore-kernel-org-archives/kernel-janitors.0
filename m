From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 28 Jun 2017 15:02:14 +0000
Subject: Re: [PATCH] staging: speakup: make function ser_to_dev static
Message-Id: <20170628150214.fvajwpuxgoz537sp@var.youpi.perso.aquilenet.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628131351.22106-1-colin.king@canonical.com>
 <5953C1DF.5010201@bfs.de>
In-Reply-To: <5953C1DF.5010201@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Colin King <colin.king@canonical.com>, William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Okash Khawaja <okash.khawaja@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Rui Teng <rui.teng@linux.vnet.ibm.com>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

walter harms, on mer. 28 juin 2017 16:49:03 +0200, wrote:
> Am 28.06.2017 15:13, schrieb Colin King:
> > diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
> > index 442f191a017e..ed8e96b06ead 100644
> > --- a/drivers/staging/speakup/spk_ttyio.c
> > +++ b/drivers/staging/speakup/spk_ttyio.c
> > @@ -21,7 +21,7 @@ struct spk_ldisc_data {
> >  static struct spk_synth *spk_ttyio_synth;
> >  static struct tty_struct *speakup_tty;
> >  
> > -int ser_to_dev(int ser, dev_t *dev_no)
> > +static int ser_to_dev(int ser, dev_t *dev_no)
> >  {
> >  	if (ser < 0 || ser > (255 - 64)) {
> >  		pr_err("speakup: Invalid ser param. Must be between 0 and 191 inclusive.\n");
> 
> 
> Is there any remark, why the programmer decided to use (255 - 64) instead of 191 ?

That's because minor numbers for ttyS* are starting from 64.

Samuel
