From: Oliver Neukum <oliver@neukum.org>
Date: Tue, 26 Jan 2010 06:50:22 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <201001260750.22160.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Dienstag, 26. Januar 2010 05:27:31 schrieb Greg KH:
> > Good point. But if that is considered critical enough then Dan's
> > original patch should go to stable instead of this one. And so should
> > the other 10+ DMA-to-stack patches in Greg's tree?
> 
> Given the age of this bug (1999) and the fact that the devices are no
> longer made, I don't think this is -stable worthy.

That's an odd form of reasoning. As the patch touches just this driver
it makes no difference if you don't have the hardware. If you have
the hardware on an architecture where it matters, this is no longer
true.

	Regards
		Oliver
