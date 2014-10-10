From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 10 Oct 2014 08:30:08 +0000
Subject: Re: [RFC] drop owner assignment from platform_drivers
Message-Id: <2106140.DbuFLh1xav@wuerfel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141010072439.GA1741@katana>
In-Reply-To: <20141010072439.GA1741@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Friday 10 October 2014 09:24:39 Wolfram Sang wrote:
> people found out that for platform_driver, we don't need to set the
> .owner field because this is done by the platform driver core. So far,
> so good. However, now I got patches removing the .owner field for this
> single i2c driver or for that one. To prevent getting thousands of
> patches fixing single drivers, I used coccinelle to remove all instances
> from the kernel. The SmPL looks like this, it doesn't blindly remove all
> THIS_MODULE, but checks if the platform_driver struct was really used by
> a call actually setting the .owner field:

Is the intention just to save a few lines in the kernel source, or are
there any additional upsides to doing this?

While it looks like an obvious cleanup, it also seems to me that there
is zero effect in terms of functionality, code size or enabling future
changes.

I'm all for adding your semantic patch to scripts/coccinelle so it gets
picked up by anyone writing new drivers or doing code cleanup on their
driver, but I'm unsure about the value of applying all your patches
for the existing drivers.

	Arnd
