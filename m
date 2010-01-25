From: Johan Hovold <jhovold@gmail.com>
Date: Mon, 25 Jan 2010 22:13:29 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100125221329.GA3681@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2010 at 10:47:31PM +0100, Oliver Neukum wrote:
> Am Montag, 25. Januar 2010 21:54:16 schrieb Johan Hovold:
> > I don't think this patch should go to stable as it does not fix anything
> > severe. Worst case is that in the unlikely event that usb_control_msg
> > fails and you have debugging enabled one may end up with 64 non-sense
> > characters in you log. There's no risk for any memory corruption
> > AFAICT.
> 
> It does fix DMA on the stack. Are you sure this is always harmless
> on non-x86?

Good point. But if that is considered critical enough then Dan's
original patch should go to stable instead of this one. And so should
the other 10+ DMA-to-stack patches in Greg's tree?

/Johan

