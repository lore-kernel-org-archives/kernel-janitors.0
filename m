From: "Miller, Mike (OS Dev)" <mike.miller@hp.com>
Date: Fri, 25 Feb 2005 19:29:05 +0000
Subject: [KJ] RE: [PATCH] block/cciss: fix sleep-loop logic
Message-Id: <D4CFB69C345C394284E4B78B876C1CF107DC02FC@cceexc23.americas.cpqcorp.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90883473123347991=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90883473123347991==
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8bit

> -----Original Message-----
> From: Nishanth Aravamudan [mailto:nacc@us.ibm.com] 
> Sent: Friday, February 25, 2005 12:37 PM
> To: Miller, Mike (OS Dev)
> Cc: ISS StorageDev; Kernel-Janitors
> Subject: [PATCH] block/cciss: fix sleep-loop logic
> 
> Hi,
> 
> Please consider applying.
> 
> Description: Use time_before() and msleep() to clean up the 
> callers of schedule_timeout(). I chose to use 
> TASK_UNINTERRUPTIBLE sleeps in two cases instead of the 
> existing TASK_INTERRUPTIBLE ones, as signals were not being 
> checked for in either case. The last change required using
> msecs_to_jiffies() to use time_before(). Patch is compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Acked-by: Mike Miller <mike.miller@hp.com>

> 
> --- 2.6.11-rc4-mm1-v/drivers/block/cciss.c	2005-02-23 
> 18:59:22.000000000 -0800
> +++ 2.6.11-rc4-mm1/drivers/block/cciss.c	2005-02-25 
> 10:33:47.000000000 -0800
> @@ -1702,16 +1702,15 @@ static int cciss_revalidate(struct 
> gendi  static unsigned long pollcomplete(int ctlr)  {
>  	unsigned long done;
> -	int i;
> +	unsigned long stop = jiffies + 20 * HZ;
>  
>  	/* Wait (up to 20 seconds) for a command to complete */
>  
> -	for (i = 20 * HZ; i > 0; i--) {
> +	while (time_before(jiffies, stop)) {
>  		done = hba[ctlr]->access.command_completed(hba[ctlr]);
> -		if (done == FIFO_EMPTY) {
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout(1);
> -		} else
> +		if (done == FIFO_EMPTY)
> +			msleep(10);
> +		else
>  			return (done);
>  	}
>  	/* Invalid address to tell caller we ran out of time */ 
> @@ -2324,6 +2323,7 @@ static int cciss_pci_init(ctlr_info_t *c
>  	__u32 cfg_base_addr;
>  	__u64 cfg_base_addr_index;
>  	int i;
> +	unsigned long stop;
>  
>  	/* check to see if controller has been disabled */
>  	/* BEFORE trying to enable it */
> @@ -2396,12 +2396,12 @@ static int cciss_pci_init(ctlr_info_t *c
>  
>  	/* Wait for the board to become ready.  (PCI hotplug 
> needs this.)
>  	 * We poll for up to 120 secs, once per 100ms. */
> -	for (i=0; i < 1200; i++) {
> +	stop = jiffies + 120 * HZ;
> +	while (time_before(jiffies, stop)) {
>  		scratchpad = readl(c->vaddr + SA5_SCRATCHPAD_OFFSET);
>  		if (scratchpad == CCISS_FIRMWARE_READY)
>  			break;
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		schedule_timeout(HZ / 10); /* wait 100ms */
> +		msleep(100);
>  	}
>  	if (scratchpad != CCISS_FIRMWARE_READY) {
>  		printk(KERN_WARNING "cciss: Board not ready.  
> Timed out.\n"); @@ -2482,12 +2482,12 @@ static int 
> cciss_pci_init(ctlr_info_t *c
>  	/* under certain very rare conditions, this can take awhile.
>  	 * (e.g.: hot replace a failed 144GB drive in a RAID 5 set right
>  	 * as we enter this code.) */
> -	for(i=0;i<MAX_CONFIG_WAIT;i++) {
> +	stop = jiffies + msecs_to_jiffies(MAX_CONFIG_WAIT);
> +	while (time_before(jiffies, stop)) {
>  		if (!(readl(c->vaddr + SA5_DOORBELL) & 
> CFGTBL_ChangeReq))
>  			break;
>  		/* delay and try again */
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		schedule_timeout(10);
> +		msleep(100);
>  	}	
>  
>  #ifdef CCISS_DEBUG
> 


--===============90883473123347991==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90883473123347991==--
