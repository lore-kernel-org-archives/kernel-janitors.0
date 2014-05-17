From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 17 May 2014 22:57:27 +0000
Subject: Re: [PATCH v3] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140517225727.GC20413@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400352033-18262-1-git-send-email-emilgoode@gmail.com>
 <20140517191821.GD16662@pengutronix.de>
 <20140517220836.GI15585@mwanda>
 <20140517223555.GR3693@n2100.arm.linux.org.uk>
In-Reply-To: <20140517223555.GR3693@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello Russell,

On Sat, May 17, 2014 at 11:35:55PM +0100, Russell King - ARM Linux wrote:
> On Sun, May 18, 2014 at 01:08:36AM +0300, Dan Carpenter wrote:
> > Let's look at that error handling again.
> > 
> > err:  <-- the name is not descriptive.  the location is bad.
> > 		kfree(pdev->dev.dma_mask);  <- null dereference.
> > 		platform_device_put(pdev);  <- ok
> > 		return ERR_PTR(-ENODEV);    <- should be "return ERR_PTR(ret);"
> > 
> > 3 out of 4 of the lines are bad.
> 
> 2 out of 4.  kfree(NULL) is perfectly legal.

I believe pdev could potentially be NULL, so it's the dereference
that is the problem.

Best regards,

Emil Goode
