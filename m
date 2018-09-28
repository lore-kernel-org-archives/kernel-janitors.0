From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 28 Sep 2018 13:10:00 +0000
Subject: Re: [PATCH -next] USB: core: remove set but not used variable 'udev'
Message-Id: <20180928131000.GA15118@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537597886-136734-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537597886-136734-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Daniel Drake <drake@endlessm.com>, Joe Perches <joe@perches.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Martin Liu <liumartin@google.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 22, 2018 at 06:31:26AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/core/driver.c: In function 'usb_driver_claim_interface':
> drivers/usb/core/driver.c:513:21: warning:
>  variable 'udev' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
>  drivers/usb/core/driver.c | 3 ---
>  1 file changed, 3 deletions(-)

This patch breaks the build, which is not ok :(
