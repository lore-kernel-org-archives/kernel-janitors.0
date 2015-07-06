From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 06 Jul 2015 06:53:46 +0000
Subject: Re: [PATCH] GPU-DRM: Delete an unnecessary check before drm_property_unreference_blob()
Message-Id: <20150706065346.GA2156@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <55998CD5.3080204@users.sourceforge.net>
 <CAEG8a3KgYtd4b6Dk0+TjcX_-gHXWMc5xv367LPvChivjM-uzRg@mail.gmail.com>
In-Reply-To: <CAEG8a3KgYtd4b6Dk0+TjcX_-gHXWMc5xv367LPvChivjM-uzRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Hunter <zhjwpku@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Mon, Jul 06, 2015 at 10:01:52AM +0800, John Hunter wrote:
> On Mon, Jul 6, 2015 at 4:00 AM, SF Markus Elfring <
> elfring@users.sourceforge.net> wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 5 Jul 2015 21:55:10 +0200
> >
> > The drm_property_unreference_blob() function tests whether its argument
> > is NULL and then returns immediately.
> > Thus the test around the call is not needed.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >
> 
> Reviewed-by: Zhao Junwang <zhjwpku@gmail.com>

Applied to topic/drm-misc, thanks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
