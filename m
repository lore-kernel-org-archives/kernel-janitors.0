From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 15 Aug 2012 13:54:32 +0000
Subject: Re: [staging:staging-next 70/73] drivers/staging/comedi/drivers/amplc_dio200.c:1444:2: error: implic
Message-Id: <20120815135432.GB22554@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502B71C7.4010005@mev.co.uk>
In-Reply-To: <502B71C7.4010005@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 15, 2012 at 10:54:15AM +0100, Ian Abbott wrote:
> On 2012-08-15 02:02, Fengguang Wu wrote:
> >Hi Ian,
> >
> >FYI, kernel build failed on
> >
> >tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> >head:   69af59970bec925d182ca5ebd80e643fdd90b1cc
> >commit: b7518888afc14e3d1e988837fef4471cd2b3c820 [70/73] staging: comedi: amplc_dio200: check bus type in detach routine
> >config: i386-allmodconfig (attached as .config)
> >
> >All related error/warning messages:
> >
> >drivers/staging/comedi/drivers/amplc_dio200.c: In function 'dio200_detach':
> >drivers/staging/comedi/drivers/amplc_dio200.c:1444:2: error: implicit declaration of function 'IS_ISA_BOARD' [-Werror=implicit-function-declaration]
> >drivers/staging/comedi/drivers/amplc_dio200.c:1447:2: error: implicit declaration of function 'IS_PCI_BOARD' [-Werror=implicit-function-declaration]
> >cc1: some warnings being treated as errors
> >
> >vim +1444 drivers/staging/comedi/drivers/amplc_dio200.c
> >   1441				}
> >   1442			}
> >   1443		}
> >>1444		if (IS_ISA_BOARD(thisboard)) {
> >   1445			if (dev->iobase)
> >   1446				release_region(dev->iobase, DIO200_IO_SIZE);
> >   1447		} else if (IS_PCI_BOARD(thisboard)) {
> 
> Well it looks like my patches got applied in the wrong order (1, 3,
> 2) on Greg's staging-next branch, but as long as all 3 patches are
> applied it ought to compile okay.

Argh, I did?  Sorry about that.  Nothing I can do about it now :(

greg k-h
