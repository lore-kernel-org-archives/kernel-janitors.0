From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 May 2014 12:24:20 +0000
Subject: Re: [PATCH] staging: gdm72xx: code cleanup
Message-Id: <20140520122420.GH15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82418154.pK7JjuYCz5@mayhem>
In-Reply-To: <82418154.pK7JjuYCz5@mayhem>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 20, 2014 at 01:52:25PM +0200, Gengis Dave wrote:
> Checkpatch.pl cleanup
> Fixed coding style
> Removed useless return
> Removed useless braces
> 

Break this up into separate patches.

>  {
>  	int i;
>  
> -	for (i = 0; i < qcb->qos_list_cnt; i++) {
> +	for (i = 0; i < qcb->qos_list_cnt; i++)
>  		if (qcb->csr[i].SFID = SFID)
>  			return i;
> -	}

The original was correct style.  Use curly braces for multi-line indents
to make them more readable.

>  
>  	if (mode) {
> -		for (i = 0; i < QOS_MAX; i++) {
> +		for (i = 0; i < QOS_MAX; i++)
>  			if (qcb->csr[i].enabled = 0) {
>  				qcb->csr[i].enabled = 1;
>  				qcb->qos_list_cnt++;
>  				return i;
>  			}
> -		}

Same.


> @@ -173,7 +169,7 @@ static int init_sdio(struct sdiowm_dev *sdev)
>  
>  fail:
>  	release_sdio(sdev);
> -	return ret;
> +	return -ENOMEM;

The original was probably better.  Same for the rest like this.

>  	spin_lock_irqsave(&rx->lock, flags);
>  	list_add(&r->list, &rx->free_list);
>  	spin_unlock_irqrestore(&rx->lock, flags);
> -	return ret;
> +	return 0;

This change is nice.

>  
>  fail:
>  	release_usb(udev);
> -	return ret;
> +	return -ENOMEM;

This change was better before.

> @@ -607,9 +606,8 @@ out:
>  		kfree(phy_dev);
>  		kfree(udev);
>  		usb_put_dev(usbdev);
> -	} else {
> +	} else
>  		usb_set_intfdata(intf, phy_dev);
> -	}

The original is correct.  If one side has curly braces then both sides
get them.

>  static void gdm_wimax_event_rcv(struct net_device *dev, u16 type, void *msg,
> @@ -263,9 +262,9 @@ static struct evt_entry *get_event_entry(void)
>  {
>  	struct evt_entry *e;
>  
> -	if (list_empty(&wm_event.freeq)) {
> +	if (list_empty(&wm_event.freeq))
>  		e = alloc_event_entry();
> -	} else {
> +	else {

Same thing.  Both sides get curly braces.

>  static void __gdm_wimax_event_send(struct work_struct *work)
>  {
> -	int idx;
> +	int idx, rd;
>  	unsigned long flags;
>  	struct evt_entry *e;
>  
> @@ -292,7 +291,7 @@ static void __gdm_wimax_event_send(struct work_struct *work)
>  		e = list_entry(wm_event.evtq.next, struct evt_entry, list);
>  		spin_unlock_irqrestore(&wm_event.evt_lock, flags);
>  
> -		sscanf(e->dev->name, "wm%d", &idx);
> +		rd = sscanf(e->dev->name, "wm%d", &idx);

This silences the warning but it doesn't fix the bug.  It's better to
leave it alone instead of hiding the bug.  Hidden bugs are far worse
than easy to fix bugs.

>  	if (cur_fsm->m_status != new_fsm->m_status ||
>  	    cur_fsm->c_status != new_fsm->c_status) {
> -		if (new_fsm->m_status = M_CONNECTED) {
> +		if (new_fsm->m_status = M_CONNECTED)
>  			netif_carrier_on(dev);
> -		} else if (cur_fsm->m_status = M_CONNECTED) {
> +		else if (cur_fsm->m_status = M_CONNECTED) {

Original is correct.

I think you get the idea.  Same for the rest of the patch.

regards,
dan carpenter

