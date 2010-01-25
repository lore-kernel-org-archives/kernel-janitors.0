From: Oliver Neukum <oliver@neukum.org>
Date: Mon, 25 Jan 2010 21:47:31 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <201001252247.31188.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Montag, 25. Januar 2010 21:54:16 schrieb Johan Hovold:
> I don't think this patch should go to stable as it does not fix anything
> severe. Worst case is that in the unlikely event that usb_control_msg
> fails and you have debugging enabled one may end up with 64 non-sense
> characters in you log. There's no risk for any memory corruption
> AFAICT.

It does fix DMA on the stack. Are you sure this is always harmless
on non-x86?

	Regards
		Oliver
