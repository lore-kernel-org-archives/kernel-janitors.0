From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 18:57:47 +0000
Subject: Re: [PATCH 3/6] for fixing xhci_readl call in xhci_mem.c after removing xhci_hcd from function defin
Message-Id: <20130816185747.GB8768@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376679005-15368-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376679005-15368-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 17, 2013 at 12:20:05AM +0530, Kumar Gaurav wrote:
> ---
>  drivers/usb/host/xhci-mem.c |   20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

The subject seems strange, what happened?  Your other patches have good
subjects, and a semi-decent body of text saying what the patch does /
why the patch is needed.  Please fix that up here as well.

thanks,

greg k-h
