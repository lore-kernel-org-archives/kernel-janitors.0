From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 04 Feb 2021 06:30:55 +0000
Subject: Re: [PATCH][next] usb: cdnsp: Fix spelling mistake "delagete" -> "delegate"
Message-Id: <YBuUnyFPvPNhkXEu@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203111239.18313-1-colin.king@canonical.com>
 <20210203130440.GV2696@kadam>
 <BYAPR07MB5381361C15E436BE54D25C93DDB39@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB5381361C15E436BE54D25C93DDB39@BYAPR07MB5381.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Laszczak <pawell@cadence.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 04, 2021 at 05:07:16AM +0000, Pawel Laszczak wrote:
> Hi Dan,
> 
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> There is a spelling mistake in a literal string. Fix it.
> >>
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  drivers/usb/cdns3/cdnsp-ep0.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
> >> index e2b1bcb3f80e..e30931ebc870 100644
> >> --- a/drivers/usb/cdns3/cdnsp-ep0.c
> >> +++ b/drivers/usb/cdns3/cdnsp-ep0.c
> >> @@ -45,7 +45,7 @@ static int cdnsp_ep0_delegate_req(struct cdnsp_device *pdev,
> >>  {
> >>  	int ret;
> >>
> >> -	trace_cdnsp_ep0_request("delagete");
> >> +	trace_cdnsp_ep0_request("delegate");
> >>
> >
> >This printk is useless and should just be deleted.  Use ftrace instead.
> 
> Maybe this printk is redundant but it's more comfortable in use.
> To debug I can simply enable cdns-dev events (echo cdnsp-dev:* > set_event)
> and I will get the full  picture of what the driver is doing.
> 
> Otherwise, I must remember which function I need to add to set_ftrace_filter.
> Of course, by default I can simply add all cdnsp* functions (echo cdnsp* > set_ftrace_filter) but it
> increases the trace log and makes it a little more difficult to analyze.
> 
> So maybe in some cases we shouldn't complain for such printk ?
> 
> It's my private opinion and not necessarily correct :)

Please don't have duplicate tracepoints for something like "this
function is now called", it's redundant.

thanks,

greg k-h
