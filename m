From: "Raghavendra Koushik" <raghavendra.koushik@neterion.com>
Date: Tue, 25 Jan 2005 02:27:18 +0000
Subject: [KJ] RE: [UPDATE PATCH 14/21] net/s2io: replace schedule_timeout()
Message-Id: <200501250227.j0P2RNDD011346@guinness.s2io.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5285936435401033=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5285936435401033==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Nishanth,

	Sorry about the delayed response. Our QA is currently 
testing the driver with these changes. I will add these changes in 
my next driver update patch.


Thanks
Koushik

> -----Original Message-----
> From: Nishanth Aravamudan [mailto:nacc@us.ibm.com] 
> Sent: Tuesday, January 18, 2005 9:34 AM
> To: raghavendra.koushik@s2io.com
> Cc: kernel-janitors@lists.osdl.org
> Subject: [UPDATE PATCH 14/21] net/s2io: replace 
> schedule_timeout() with msleep()
> 
> On Mon, Jan 17, 2005 at 03:05:53PM -0800, Nishanth Aravamudan wrote:
> > Hi,
> > 
> > Please consider applying. 
> 
> There was a typo in the previous patch (changed HZ/2 to 200, 
> thanks Domen for
> catching this!). Fixed below:
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task
> delays as expected. This makes the code independent of HZ 
> values (particularly
> important when HZ changes or is dynamic).
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- 2.6.11-rc1-kj-v/drivers/net/s2io.c	2005-01-15 
> 16:55:41.000000000 -0800
> +++ 2.6.11-rc1-kj/drivers/net/s2io.c	2005-01-16 
> 23:50:59.000000000 -0800
> @@ -684,8 +684,7 @@ static int init_nic(struct s2io_nic *nic
>  	val64 = 0;
>  	writeq(val64, &bar0->sw_reset);
>  	val64 = readq(&bar0->sw_reset);
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 2);
> +	msleep(500);
>  
>  	/*  Enable Receiving broadcasts */
>  	add = (void *) &bar0->mac_cfg;
> @@ -938,8 +937,7 @@ static int init_nic(struct s2io_nic *nic
>  				  dev->name);
>  			return -1;
>  		}
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  		time++;
>  	}
>  
> @@ -977,8 +975,7 @@ static int init_nic(struct s2io_nic *nic
>  			return -1;
>  		}
>  		time++;
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  	}
>  
>  	/* 
> @@ -1407,8 +1404,7 @@ static int start_nic(struct s2io_nic *ni
>  	SPECIAL_REG_WRITE(val64, &bar0->mc_rldram_mrs, UF);
>  	val64 = readq(&bar0->mc_rldram_mrs);
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 10);	/* Delay by around 100 ms. */
> +	msleep(100);			/* Delay by around 100 ms. */
>  
>  	/* Enabling ECC Protection. */
>  	val64 = readq(&bar0->adapter_control);
> @@ -2423,8 +2419,7 @@ int wait_for_cmd_complete(nic_t * sp)
>  			ret = SUCCESS;
>  			break;
>  		}
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  		if (cnt++ > 10)
>  			break;
>  	}
> @@ -2463,15 +2458,13 @@ void s2io_reset(nic_t * sp)
>  	 * As of now I'am just giving a 250ms delay and hoping that the
>  	 * PCI write to sw_reset register is done by this time.
>  	 */
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 4);
> +	msleep(250);
>  
>  	/* Restore the PCI state saved during initializarion. */
>  	pci_restore_state(sp->pdev);
>  	s2io_init_pci(sp);
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 4);
> +	msleep(250);
>  
>  	/* SXE-002: Configure link and activity LED to turn it off */
>  	subid = sp->pdev->subsystem_device;
> @@ -3391,8 +3384,7 @@ static int read_eeprom(nic_t * sp, int o
>  			ret = 0;
>  			break;
>  		}
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  		exit_cnt++;
>  	}
>  
> @@ -3432,8 +3424,7 @@ static int write_eeprom(nic_t * sp, int 
>  				ret = 0;
>  			break;
>  		}
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  		exit_cnt++;
>  	}
>  
> @@ -3689,8 +3680,7 @@ static int s2io_bist_test(nic_t * sp, ui
>  			ret = 0;
>  			break;
>  		}
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 10);
> +		msleep(100);
>  		cnt++;
>  	}
>  
> @@ -3791,8 +3781,7 @@ static int s2io_rldram_test(nic_t * sp, 
>  			val64 = readq(&bar0->mc_rldram_test_ctrl);
>  			if (val64 & MC_RLDRAM_TEST_DONE)
>  				break;
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout(HZ / 5);
> +			msleep(200);
>  		}
>  
>  		if (cnt == 5)
> @@ -3808,8 +3797,7 @@ static int s2io_rldram_test(nic_t * sp, 
>  			val64 = readq(&bar0->mc_rldram_test_ctrl);
>  			if (val64 & MC_RLDRAM_TEST_DONE)
>  				break;
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout(HZ / 2);
> +			msleep(500);
>  		}
>  
>  		if (cnt == 5)
> @@ -4169,8 +4157,7 @@ static void s2io_set_link(unsigned long 
>  	 * Allow a small delay for the NICs self initiated 
>  	 * cleanup to complete.
>  	 */
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ / 10);
> +	msleep(100);
>  
>  	val64 = readq(&bar0->adapter_status);
>  	if (verify_xena_quiescence(val64, nic->device_enabled_once)) {
> @@ -4224,10 +4211,8 @@ static void s2io_card_down(nic_t * sp)
>  	register u64 val64 = 0;
>  
>  	/* If s2io_set_link task is executing, wait till it 
> completes. */
> -	while (test_and_set_bit(0, &(sp->link_state))) {
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> -	}
> +	while (test_and_set_bit(0, &(sp->link_state)))
> +		msleep(50);
>  	atomic_set(&sp->card_state, CARD_DOWN);
>  
>  	/* disable Tx and Rx traffic on the NIC */
> @@ -4243,8 +4228,7 @@ static void s2io_card_down(nic_t * sp)
>  			break;
>  		}
>  
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ / 20);
> +		msleep(50);
>  		cnt++;
>  		if (cnt == 10) {
>  			DBG_PRINT(ERR_DBG,
> 


--===============5285936435401033==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5285936435401033==--
