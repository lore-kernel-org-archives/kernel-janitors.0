From: Greg KH <greg@kroah.com>
Date: Wed, 09 May 2012 20:24:08 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710 : Corrected DPRINTK formatting
Message-Id: <20120509202408.GA11298@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 03, 2012 at 06:27:36PM +0300, Tomas Melin wrote:
> Corrected formatting for several DPRINT messages.
> 
> Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
> ---
>  drivers/staging/comedi/drivers/adv_pci1710.c |   20 ++++++++------------
>  1 files changed, 8 insertions(+), 12 deletions(-)

For some reason this patch doesn't apply at all, care to redo it against
the linux-next tree and resend?

thanks,

greg k-h
