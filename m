From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 15 May 2014 23:01:44 +0000
Subject: Re: [PATCH] ARM: imx: clean up error handling
Message-Id: <20140515230144.GA10217@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400181871-10325-1-git-send-email-emilgoode@gmail.com>
 <20140515203212.GD8897@mwanda>
In-Reply-To: <20140515203212.GD8897@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello Dan,

Thanks for the review and sorry for the late reply.

On Thu, May 15, 2014 at 11:32:13PM +0300, Dan Carpenter wrote:
> On Thu, May 15, 2014 at 09:24:30PM +0200, Emil Goode wrote:
> > If we fail to allocate struct platform_device pdev we
> > dereference it after the goto label err.
> > 
> > I have rearranged the error handling a bit to fix the issue
> > and also make it more clear.
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> >  arch/arm/mach-imx/devices/platform-ipu-core.c |   22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/arm/mach-imx/devices/platform-ipu-core.c
> > index fc4dd7c..14d61d9 100644
> > --- a/arch/arm/mach-imx/devices/platform-ipu-core.c
> > +++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
> > @@ -77,34 +77,38 @@ struct platform_device *__init imx_alloc_mx3_camera(
> >  
> >  	pdev = platform_device_alloc("mx3-camera", 0);
> >  	if (!pdev)
> > -		goto err;
> > +		return ERR_PTR(ret);
> 
> It's more readable to say "return ERR_PTR(-ENOMEM);".

I think so to, will change this one but still use the ret variable at the
bottom of the function.

> 
> This patch is great but the subject should say "fix" and not "clean up"
> since it fixes a NULL dereference bug.  The people who call their
> checkpatch.pl clean ups "fixes" are also doing it wrong but those are
> newbies and not worth educating.

I agree, it's a bug fix and not a clean up.

Will resend tomorrow.

Best regards,

Emil Goode

> 
> regards,
> dan carpenter
> 
