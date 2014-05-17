From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Sat, 17 May 2014 22:35:55 +0000
Subject: Re: [PATCH v3] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140517223555.GR3693@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400352033-18262-1-git-send-email-emilgoode@gmail.com>
 <20140517191821.GD16662@pengutronix.de> <20140517220836.GI15585@mwanda>
In-Reply-To: <20140517220836.GI15585@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sun, May 18, 2014 at 01:08:36AM +0300, Dan Carpenter wrote:
> Let's look at that error handling again.
> 
> err:  <-- the name is not descriptive.  the location is bad.
> 		kfree(pdev->dev.dma_mask);  <- null dereference.
> 		platform_device_put(pdev);  <- ok
> 		return ERR_PTR(-ENODEV);    <- should be "return ERR_PTR(ret);"
> 
> 3 out of 4 of the lines are bad.

2 out of 4.  kfree(NULL) is perfectly legal.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
