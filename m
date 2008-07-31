From: krzysztof.h1@poczta.fm
Date: Thu, 31 Jul 2008 08:29:45 +0000
Subject: Re: [Linux-fbdev-devel] [PATCH] atyfb_base.c: fix warning
Message-Id: <20080731082945.6AEA31E3074@f03.poczta.interia.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "M. Asselstine" <asselsm@mcmaster.ca>, Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-fbdev-devel@lists.sourceforge.net" <linux-fbdev-devel@lists.sourceforge.net>, "syrjala@sci.fi" <syrjala@sci.fi>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adaplas@gmail.com" <adaplas@gmail.com>

> On Wed, Jul 30, 2008 at 5:03 PM, Alexander Beregalov
> <a.beregalov@gmail.com> wrote:
> > From: Alexander Beregalov <a.beregalov@gmail.com>
> >
> > atyfb_base.c: fix warning
> >
> > drivers/video/aty/atyfb_base.c:2663: warning: 'aty_resume_chip' defined
> > but not used
> >
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> > Cc: Ville Syrjala <syrjala@sci.fi>
> > Cc: Antonino A. Daplas <adaplas@pol.net>
> 
> Looks good, should you maybe move the aty_resume_chip() up into the
> existing #if defined(CONFIG_PM) &&... that atyfb_pci_resume() is in?
> Not sure, just a thought.
> 

The same thought has crossed my mind. Kill the forward declaration and move this short function before atyfb_pci_resume().

Regards,
Krzysztof 


----------------------------------------------------------------------
W kosciele tez zdarzaja sie wpadki!
Smieszny filmik >>> http://link.interia.pl/f1e61

