From: Greg KH <greg@kroah.com>
Date: Tue, 12 Oct 2010 18:02:27 +0000
Subject: Re: [PATCH] serial: omap-serial: fix signess error
Message-Id: <20101012180227.GA11846@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731715-17908-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1286731715-17908-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Govindraj.R" <govindraj.raja@ti.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kevin Hilman <khilman@deeprootsystems.com>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org

On Sun, Oct 10, 2010 at 09:28:35PM +0400, Vasiliy Kulikov wrote:
> "ret" is unsigned, so check for (ret < 0) made no sense.
> Made it signed.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  I cannot compile this driver, so it is not tested.
> 
>  drivers/serial/omap-serial.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

This seems to be in the omap tree, and not in my tree, so you will need
to push this through the omap maintainers.

thanks,

greg k-h
