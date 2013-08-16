From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Fri, 16 Aug 2013 19:24:34 +0000
Subject: Re: [PATCH 5/6] for fixing xhci_readl call in xhci_hub.c after removing xhci_hcd from function defin
Message-Id: <20130816192434.GG7975@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

In general, please keep the short descriptions of your patches (which
turn into the subject lines of your mails) limited to around 55
characters.

Also, please make sure to include the driver or subsystem prefix as the
first word in your short description.  For the xHCI driver, the
preferred prefix is xhci, although some people have used usb in the
past.  You can see the prefixes used in the git log:

sarah@xanatos:~/git/kernels/xhci$ git log --pretty=oneline --abbrev-commit drivers/usb/host/xhci*
d66eaf9 xhci: fix null pointer dereference on ring_doorbell_for_active_rings
07f3cb7 usb: host: xhci: Enable XHCI_SPURIOUS_SUCCESS for all controllers with xhci 1.0
d5c82fe usb: xhci: Mark two functions __maybe_unused
203a866 xhci: Avoid NULL pointer deref when host dies.
1f21569 xhci: Add missing unlocks on error paths
5388a3a usb: host: xhci-plat: release mem region while removing module
025f880 xhci: check for failed dma pool allocation
17d65554 xhci: remove BUG() in xhci_get_endpoint_type()
bd18fd5 xhci: Remove BUG in xhci_setup_addressable_virt_dev
92f8e76 xhci: Remove BUG_ON in xhci_get_input_control_ctx.
29f9d54 xhci: Remove BUG_ON() in xhci_alloc_container_ctx.

That way, you don't have to mention file names at all in your short
description, and people will know at a glance which driver this commit
is for.

Sarah Sharp

On Sat, Aug 17, 2013 at 12:23:31AM +0530, Kumar Gaurav wrote:
> ---
>  drivers/usb/host/xhci-hub.c |   72 +++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 1d35459..c0198af 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -93,7 +93,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	 */
>  	memset(port_removable, 0, sizeof(port_removable));
>  	for (i = 0; i < ports; i++) {
> -		portsc = xhci_readl(xhci, xhci->usb2_ports[i]);
> +		portsc = xhci_readl(xhci->usb2_ports[i]);
>  		/* If a device is removable, PORTSC reports a 0, same as in the
>  		 * hub descriptor DeviceRemovable bits.
>  		 */
> @@ -147,7 +147,7 @@ static void xhci_usb3_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  	port_removable = 0;
>  	/* bit 0 is reserved, bit 1 is for port 1, etc. */
>  	for (i = 0; i < ports; i++) {
> -		portsc = xhci_readl(xhci, xhci->usb3_ports[i]);
> +		portsc = xhci_readl(xhci->usb3_ports[i]);
>  		if (portsc & PORT_DEV_REMOVE)
>  			port_removable |= 1 << (i + 1);
>  	}
> @@ -342,7 +342,7 @@ static void xhci_disable_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
>  
>  	/* Write 1 to disable the port */
>  	xhci_writel(xhci, port_status | PORT_PE, addr);
> -	port_status = xhci_readl(xhci, addr);
> +	port_status = xhci_readl(addr);
>  	xhci_dbg(xhci, "disable port, actual port %d status  = 0x%x\n",
>  			wIndex, port_status);
>  }
> @@ -388,7 +388,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
>  	}
>  	/* Change bits are all write 1 to clear */
>  	xhci_writel(xhci, port_status | status, addr);
> -	port_status = xhci_readl(xhci, addr);
> +	port_status = xhci_readl(addr);
>  	xhci_dbg(xhci, "clear port %s change, actual port %d status  = 0x%x\n",
>  			port_change_bit, wIndex, port_status);
>  }
> @@ -414,7 +414,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, __le32 __iomem **port_array,
>  {
>  	u32 temp;
>  
> -	temp = xhci_readl(xhci, port_array[port_id]);
> +	temp = xhci_readl(port_array[port_id]);
>  	temp = xhci_port_state_to_neutral(temp);
>  	temp &= ~PORT_PLS_MASK;
>  	temp |= PORT_LINK_STROBE | link_state;
> @@ -426,7 +426,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
>  {
>  	u32 temp;
>  
> -	temp = xhci_readl(xhci, port_array[port_id]);
> +	temp = xhci_readl(port_array[port_id]);
>  	temp = xhci_port_state_to_neutral(temp);
>  
>  	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
> @@ -453,7 +453,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, __le32 __iomem **port_array,
>  {
>  	u32 temp;
>  
> -	temp = xhci_readl(xhci, port_array[port_id]);
> +	temp = xhci_readl(port_array[port_id]);
>  	if (temp & port_bit) {
>  		temp = xhci_port_state_to_neutral(temp);
>  		temp |= port_bit;
> @@ -583,12 +583,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		/* Set the U1 and U2 exit latencies. */
>  		memcpy(buf, &usb_bos_descriptor,
>  				USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE);
> -		temp = xhci_readl(xhci, &xhci->cap_regs->hcs_params3);
> +		temp = xhci_readl(&xhci->cap_regs->hcs_params3);
>  		buf[12] = HCS_U1_LATENCY(temp);
>  		put_unaligned_le16(HCS_U2_LATENCY(temp), &buf[13]);
>  
>  		/* Indicate whether the host has LTM support. */
> -		temp = xhci_readl(xhci, &xhci->cap_regs->hcc_params);
> +		temp = xhci_readl(&xhci->cap_regs->hcc_params);
>  		if (HCC_LTC(temp))
>  			buf[8] |= USB_LTM_SUPPORT;
>  
> @@ -599,7 +599,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			goto error;
>  		wIndex--;
>  		status = 0;
> -		temp = xhci_readl(xhci, port_array[wIndex]);
> +		temp = xhci_readl(port_array[wIndex]);
>  		if (temp = 0xffffffff) {
>  			retval = -ENODEV;
>  			break;
> @@ -709,7 +709,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		if (!wIndex || wIndex > max_ports)
>  			goto error;
>  		wIndex--;
> -		temp = xhci_readl(xhci, port_array[wIndex]);
> +		temp = xhci_readl(port_array[wIndex]);
>  		if (temp = 0xffffffff) {
>  			retval = -ENODEV;
>  			break;
> @@ -718,7 +718,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		/* FIXME: What new port features do we need to support? */
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			if ((temp & PORT_PLS_MASK) != XDEV_U0) {
>  				/* Resume the port to U0 first */
>  				xhci_set_link_state(xhci, port_array, wIndex,
> @@ -731,7 +731,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			 * a port unless the port reports that it is in the
>  			 * enabled (PED = ‘1’,PLS < ‘3’) state.
>  			 */
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			if ((temp & PORT_PE) = 0 || (temp & PORT_RESET)
>  				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
>  				xhci_warn(xhci, "USB core suspending device "
> @@ -756,11 +756,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			msleep(10); /* wait device to enter */
>  			spin_lock_irqsave(&xhci->lock, flags);
>  
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			bus_state->suspended_ports |= 1 << wIndex;
>  			break;
>  		case USB_PORT_FEAT_LINK_STATE:
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  
>  			/* Disable port */
>  			if (link_state = USB_SS_PORT_LS_SS_DISABLED) {
> @@ -775,7 +775,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  					PORT_CEC;
>  				xhci_writel(xhci, temp | PORT_PE,
>  					port_array[wIndex]);
> -				temp = xhci_readl(xhci, port_array[wIndex]);
> +				temp = xhci_readl(port_array[wIndex]);
>  				break;
>  			}
>  
> @@ -784,7 +784,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				xhci_dbg(xhci, "Enable port %d\n", wIndex);
>  				xhci_set_link_state(xhci, port_array, wIndex,
>  						link_state);
> -				temp = xhci_readl(xhci, port_array[wIndex]);
> +				temp = xhci_readl(port_array[wIndex]);
>  				break;
>  			}
>  
> @@ -818,7 +818,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			msleep(20); /* wait device to enter */
>  			spin_lock_irqsave(&xhci->lock, flags);
>  
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			if (link_state = USB_SS_PORT_LS_U3)
>  				bus_state->suspended_ports |= 1 << wIndex;
>  			break;
> @@ -832,7 +832,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			xhci_writel(xhci, temp | PORT_POWER,
>  					port_array[wIndex]);
>  
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			xhci_dbg(xhci, "set port power, actual port %d status  = 0x%x\n", wIndex, temp);
>  
>  			spin_unlock_irqrestore(&xhci->lock, flags);
> @@ -847,13 +847,13 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			temp = (temp | PORT_RESET);
>  			xhci_writel(xhci, temp, port_array[wIndex]);
>  
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			xhci_dbg(xhci, "set port reset, actual port %d status  = 0x%x\n", wIndex, temp);
>  			break;
>  		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
>  			xhci_set_remote_wake_mask(xhci, port_array,
>  					wIndex, wake_mask);
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			xhci_dbg(xhci, "set port remote wake mask, "
>  					"actual port %d status  = 0x%x\n",
>  					wIndex, temp);
> @@ -862,12 +862,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			temp |= PORT_WR;
>  			xhci_writel(xhci, temp, port_array[wIndex]);
>  
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			break;
>  		case USB_PORT_FEAT_U1_TIMEOUT:
>  			if (hcd->speed != HCD_USB3)
>  				goto error;
> -			temp = xhci_readl(xhci, port_array[wIndex] + PORTPMSC);
> +			temp = xhci_readl(port_array[wIndex] + PORTPMSC);
>  			temp &= ~PORT_U1_TIMEOUT_MASK;
>  			temp |= PORT_U1_TIMEOUT(timeout);
>  			xhci_writel(xhci, temp, port_array[wIndex] + PORTPMSC);
> @@ -875,7 +875,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		case USB_PORT_FEAT_U2_TIMEOUT:
>  			if (hcd->speed != HCD_USB3)
>  				goto error;
> -			temp = xhci_readl(xhci, port_array[wIndex] + PORTPMSC);
> +			temp = xhci_readl(port_array[wIndex] + PORTPMSC);
>  			temp &= ~PORT_U2_TIMEOUT_MASK;
>  			temp |= PORT_U2_TIMEOUT(timeout);
>  			xhci_writel(xhci, temp, port_array[wIndex] + PORTPMSC);
> @@ -884,13 +884,13 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			goto error;
>  		}
>  		/* unblock any posted writes */
> -		temp = xhci_readl(xhci, port_array[wIndex]);
> +		temp = xhci_readl(port_array[wIndex]);
>  		break;
>  	case ClearPortFeature:
>  		if (!wIndex || wIndex > max_ports)
>  			goto error;
>  		wIndex--;
> -		temp = xhci_readl(xhci, port_array[wIndex]);
> +		temp = xhci_readl(port_array[wIndex]);
>  		if (temp = 0xffffffff) {
>  			retval = -ENODEV;
>  			break;
> @@ -899,7 +899,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  		temp = xhci_port_state_to_neutral(temp);
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
> -			temp = xhci_readl(xhci, port_array[wIndex]);
> +			temp = xhci_readl(port_array[wIndex]);
>  			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
>  			xhci_dbg(xhci, "PORTSC %04x\n", temp);
>  			if (temp & PORT_RESET)
> @@ -1004,7 +1004,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
>  	spin_lock_irqsave(&xhci->lock, flags);
>  	/* For each port, did anything change?  If so, set that bit in buf. */
>  	for (i = 0; i < max_ports; i++) {
> -		temp = xhci_readl(xhci, port_array[i]);
> +		temp = xhci_readl(port_array[i]);
>  		if (temp = 0xffffffff) {
>  			retval = -ENODEV;
>  			break;
> @@ -1058,7 +1058,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  		u32 t1, t2;
>  		int slot_id;
>  
> -		t1 = xhci_readl(xhci, port_array[port_index]);
> +		t1 = xhci_readl(port_array[port_index]);
>  		t2 = xhci_port_state_to_neutral(t1);
>  
>  		if ((t1 & PORT_PE) && !(t1 & PORT_PLS_MASK)) {
> @@ -1100,7 +1100,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  
>  			/* Get the port power control register address. */
>  			addr = port_array[port_index] + PORTPMSC;
> -			tmp = xhci_readl(xhci, addr);
> +			tmp = xhci_readl(addr);
>  			tmp |= PORT_RWE;
>  			xhci_writel(xhci, tmp, addr);
>  		}
> @@ -1133,7 +1133,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  	}
>  
>  	/* delay the irqs */
> -	temp = xhci_readl(xhci, &xhci->op_regs->command);
> +	temp = xhci_readl(&xhci->op_regs->command);
>  	temp &= ~CMD_EIE;
>  	xhci_writel(xhci, temp, &xhci->op_regs->command);
>  
> @@ -1144,7 +1144,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  		u32 temp;
>  		int slot_id;
>  
> -		temp = xhci_readl(xhci, port_array[port_index]);
> +		temp = xhci_readl(port_array[port_index]);
>  		if (DEV_SUPERSPEED(temp))
>  			temp &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
>  		else
> @@ -1192,20 +1192,20 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  			 * the port power control register address.
>  			 */
>  			addr = port_array[port_index] + PORTPMSC;
> -			tmp = xhci_readl(xhci, addr);
> +			tmp = xhci_readl(addr);
>  			tmp &= ~PORT_RWE;
>  			xhci_writel(xhci, tmp, addr);
>  		}
>  	}
>  
> -	(void) xhci_readl(xhci, &xhci->op_regs->command);
> +	(void) xhci_readl(&xhci->op_regs->command);
>  
>  	bus_state->next_statechange = jiffies + msecs_to_jiffies(5);
>  	/* re-enable irqs */
> -	temp = xhci_readl(xhci, &xhci->op_regs->command);
> +	temp = xhci_readl(&xhci->op_regs->command);
>  	temp |= CMD_EIE;
>  	xhci_writel(xhci, temp, &xhci->op_regs->command);
> -	temp = xhci_readl(xhci, &xhci->op_regs->command);
> +	temp = xhci_readl(&xhci->op_regs->command);
>  
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>  	return 0;
> -- 
> 1.7.9.5
> 
