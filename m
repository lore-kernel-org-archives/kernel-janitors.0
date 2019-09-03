From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 03 Sep 2019 13:43:04 +0000
Subject: Re: [PATCH][usb-next] usb: cdns3: fix missing assignment of ret before error check on ret
Message-Id: <20190903134304.GB9435@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190902145035.18200-1-colin.king@canonical.com>
 <BYAPR07MB4709DF377BFBD54FD6BF88B3DDBE0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <BYAPR07MB470927CBDF6CC2345DD350E6DDB90@BYAPR07MB4709.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB470927CBDF6CC2345DD350E6DDB90@BYAPR07MB4709.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Laszczak <pawell@cadence.com>
Cc: Colin King <colin.king@canonical.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 03, 2019 at 03:29:50AM +0000, Pawel Laszczak wrote:
> Hi Colin
> 
> >Hi Colin
> >
> >>
> >>From: Colin Ian King <colin.king@canonical.com>
> >>
> >>Currently the check on a non-zero return code in ret is false because
> >>ret has been initialized to zero.  I believe that ret should be assigned
> >>to the return from the call to readl_poll_timeout_atomic before the
> >>check on ret.  Since ret is being re-assinged the original initialization
> >>of ret to zero can be removed.
> >
> >Thanks you for letting me know.
> >Fortunately that's not a critical bug and has no impact for driver.
> >I will correct it.
> >
> >Cheers
> >Pawell
> >
> >>
> >>Addresses-Coverity: ("'Constant' variable guards dead code")
> >>Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> >>Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>---
> >> drivers/usb/cdns3/gadget.c | 6 +++---
> >> 1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> >>index 3094ad65ffc9..0eb3022838d6 100644
> >>--- a/drivers/usb/cdns3/gadget.c
> >>+++ b/drivers/usb/cdns3/gadget.c
> >>@@ -2154,7 +2154,7 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
> >> {
> >> 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
> >> 	struct usb_request *request;
> >>-	int ret = 0;
> >>+	int ret;
> >> 	int val;
> >>
> >> 	trace_cdns3_halt(priv_ep, 0, 0);
> >>@@ -2162,8 +2162,8 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
> >> 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> >>
> >> 	/* wait for EPRST cleared */
> >>-	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> >>-				  !(val & EP_CMD_EPRST), 1, 100);
> >>+	ret = readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> >>+					!(val & EP_CMD_EPRST), 1, 100);
> >> 	if (ret)
> >> 		return -EINVAL;
> 
> What about such condition:
> 	if (unlikely(ret)) {

Only use likely/unlikely if you can actually measure the performance
impact of not using it.  Otherwise drop it as the compiler and CPU will
almost always get it correct for you (like in this case).

thanks,

greg k-h
