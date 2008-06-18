From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 23:15:56 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <1213830956.26255.1360.camel@pmac.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2008-06-18 at 16:05 -0700, David Miller wrote:
> Tell me this, how can I (with the default config option settings)
> netboot properly without an initial ramdisk after these tg3 patches
> and still get the proper firmware?

I suppose the facetious answer is that you can't, just as you can't do
it with a default config _before_ these patches -- because neither
CONFIG_TIGON3 nor the various options you need for nfsroot are enabled
by default.

But if you _have_ a working nfsroot+tg3 config and you apply these
patches, then all you need to do is say 'y' when you're asked if you
want to include the firmware for it:
	CONFIG_TIGON3_FIRMWARE=y

If you are competent enough to get nfsroot working, it isn't really very
credible to claim you lack the wit to say 'y' when asked that question,
surely?

Solving that problem was step #1 in the process of converting drivers to
use request_firmware(). You _have_ to be able to build the firmware into
the kernel image, and you _can_.

-- 
dwmw2

