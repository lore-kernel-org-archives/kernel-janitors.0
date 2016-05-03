From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 03 May 2016 21:19:24 +0000
Subject: Re: [patch] usb: dwc3: gadget: fix mask and shift order in DWC3_DCFG_NUMP()
Message-Id: <20160503211924.GB10279@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160503074900.GA9816@mwanda>
 <87shxzfuhq.fsf@intel.com>
In-Reply-To: <87shxzfuhq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 03, 2016 at 10:53:05AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> > In the original DWC3_DCFG_NUMP() was always zero.  It looks like the
> > intent was to shift first and then do the mask.
> >
> > Fixes: 2a58f9c12bb3 ('usb: dwc3: gadget: disable automatic calculation of ACK TP NUMP')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for this fix, I completely missed it :-) Greg, if you want to
> take this as a patch, that's fine by me. Otherwise I can queue it for
> -rc1. In any case, S-o-B below:
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>

I'll take it, thanks.

greg k-h
