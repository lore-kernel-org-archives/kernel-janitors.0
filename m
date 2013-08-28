From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 28 Aug 2013 22:46:27 +0000
Subject: Re: [patch] dma: cppi41: off by one in desc_to_chan()
Message-Id: <20130828224627.GA4281@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130826083220.GM2748@intel.com>
 <20130828104844.GG19256@mwanda>
In-Reply-To: <20130828104844.GG19256@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org

On Wed, Aug 28, 2013 at 01:48:44PM +0300, Dan Carpenter wrote:
> The test here should be ">=" instead of ">".  The cdd->chan_busy[] array
> has "ALLOC_DECS_NUM" elements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> ---
> Resending to Greg and the USB people because Vinod says this goes
> through the USB tree.

Really?  Ok, that seems odd, but whatever...

