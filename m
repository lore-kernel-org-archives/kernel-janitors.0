From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 04 May 2016 05:56:09 +0000
Subject: Re: [PATCH] staging: dgnc: Fix a NULL pointer dereference
Message-Id: <20160504055609.GA30446@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504054122.GA11128@certreview.com>
In-Reply-To: <20160504054122.GA11128@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: lidza.louina@gmail.com, markh@compro.net, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com

On Wed, May 04, 2016 at 02:41:22PM +0900, Daeseok Youn wrote:
> The error handling for print_drive after calling tty_alloc_driver()
> was needed. But there was error handling but too late for this.
> Error handling code moved after tty_alloc_driver() call.
> 
> Fixes: 60b3109e5e2d ("staging: dgnc: use tty_alloc_driver instead of kcalloc")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_tty.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Patch doesn't apply at all, does it need something else to be merged
first?

confused,

greg k-h
