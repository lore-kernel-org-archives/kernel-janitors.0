From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 19:04:33 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/e100: replace schedule_timeout()
Message-Id: <20040814190433.GJ1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81966027305584366=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81966027305584366==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 
> 
> Thanks,
> Nish
> 
> 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> 
> --- linux-vanilla/drivers/net/e100.c	2004-06-16 05:20:26.000000000 +0000
> +++ linux-dev/drivers/net/e100.c	2004-07-12 18:59:43.000000000 +0000
> @@ -613,8 +613,7 @@ static int e100_self_test(struct nic *ni
>  	writel(selftest | dma_addr, &nic->csr->port);
>  	e100_write_flush(nic);
>  	/* Wait 10 msec for self-test to complete */
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 100 + 1);
> +	msleep(10);
>  
>  	/* Interrupts are enabled after self-test */
>  	e100_disable_irq(nic);
> @@ -662,9 +661,8 @@ static void e100_eeprom_write(struct nic
>  			e100_write_flush(nic); udelay(4);
>  		}
>  		/* Wait 10 msec for cmd to complete */
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 100 + 1);
> -
> +		msleep(10);
> +		
this whitespace wasn't there before.
>  		/* Chip deselect */
>  		writeb(0, &nic->csr->eeprom_ctrl_lo);
>  		e100_write_flush(nic); udelay(4);
> @@ -1734,8 +1732,7 @@ static int e100_loopback_test(struct nic
>  	memset(skb->data, 0xFF, ETH_DATA_LEN);
>  	e100_xmit_frame(skb, nic->netdev);
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 100 + 1);
> +	msleep(10);
>  
>  	if(memcmp(nic->rx_to_clean->skb->data + sizeof(struct rfd),
>  	   skb->data, ETH_DATA_LEN))
> @@ -1821,8 +1818,7 @@ static void e100_get_regs(struct net_dev
>  			mdio_read(netdev, nic->mii.phy_id, i);
>  	memset(nic->mem->dump_buf, 0, sizeof(nic->mem->dump_buf));
>  	e100_exec_cb(nic, NULL, e100_dump);
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 100 + 1);
> +	msleep(10);
>  	memcpy(&buff[2 + E100_PHY_REGS], nic->mem->dump_buf,
>  		sizeof(nic->mem->dump_buf));
>  }
> @@ -1987,8 +1983,7 @@ static int e100_phys_id(struct net_devic
>  	if(!data || data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ))
>  		data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
>  	mod_timer(&nic->blink_timer, jiffies);
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout(data * HZ);
> +	msleep(data * 1000);
>  	del_timer_sync(&nic->blink_timer);
>  	mdio_write(netdev, nic->mii.phy_id, MII_LED_CONTROL, 0);
>  

*nitpicking* 
a++ maks

--===============81966027305584366==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81966027305584366==--
