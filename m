From: Alan Stern <stern@rowland.harvard.edu>
Date: Fri, 28 Sep 2018 20:35:09 +0000
Subject: Re: [PATCH -next] USB: core: remove set but not used variable 'udev'
Message-Id: <Pine.LNX.4.44L0.1809281631550.9883-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537597886-136734-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537597886-136734-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, Daniel Drake <drake@endlessm.com>, Joe Perches <joe@perches.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Martin Liu <liumartin@google.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 28 Sep 2018, Greg Kroah-Hartman wrote:

> On Sat, Sep 22, 2018 at 06:31:26AM +0000, YueHaibing wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > drivers/usb/core/driver.c: In function 'usb_driver_claim_interface':
> > drivers/usb/core/driver.c:513:21: warning:
> >  variable 'udev' set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > ---
> >  drivers/usb/core/driver.c | 3 ---
> >  1 file changed, 3 deletions(-)
> 
> This patch breaks the build, which is not ok :(

Are you sure you applied it to the right branch?  It requires commit 
c183813fcee44a24 ("USB: remove LPM management from 
usb_driver_claim_interface()").  Probably the tags should mention this.

Alan Stern
