From: "Ravinandan Arakali" <ravinandan.arakali@neterion.com>
Date: Wed, 09 Feb 2005 18:37:59 +0000
Subject: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <000801c50ed6$7b101950$4510100a@pc.s2io.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============052496635207042397=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============052496635207042397==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Nishanth,
We did some basic testing after applying your patch and it seems okay.
Pls submit the patch to maintainer. But I've couple of comments on
your patch.
The below code change is incorrect. It should be msleep(500).
> @@ -3808,8 +3797,7 @@ static int s2io_rldram_test(nic_t * sp, 
>  			val64 = readq(&bar0->mc_rldram_test_ctrl);
>  			if (val64 & MC_RLDRAM_TEST_DONE)
>  				break;
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout(HZ / 2);
> +			msleep(200);

In the function s2io_ethtool_idnic(), call to schedule_timeout() has not
been replaced with msleep(). I've given below the code change I did before
testing.

@@ -3284,11 +3277,10 @@
                sp->id_timer.data = (unsigned long) sp;
        }
        mod_timer(&sp->id_timer, jiffies);
-       set_current_state(TASK_INTERRUPTIBLE);
        if (data)
-               schedule_timeout(data * HZ);
+               msleep(data*1000);
        else
-               schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+               msleep(0xFFFFFFFF);
        del_timer_sync(&sp->id_timer);

        if (CARDS_WITH_FAULTY_LINK_INDICATORS(subid)) {


Thanks,
Ravi

-----Original Message-----
From: Raghavendra Koushik [mailto:raghavendra.koushik@s2io.com]
Sent: Monday, January 17, 2005 3:15 PM
To: 'Nishanth Aravamudan'
Cc: kernel-janitors@lists.osdl.org; 'Ravinandan Arakali'
Subject: RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
msleep()


Correct me if Iam wrong, but isn't HZ always defined as 
"number of jiffies" on the machine that equals 1sec in duration. 
So even if duration of jiffy varies, Macro HZ is assured to be 1 sec.
This way schedule_timeout (HZ / 2) on any machine is supposed to 
timeout after half a second and so on and so forth.

-Koushik

> -----Original Message-----
> From: Nishanth Aravamudan [mailto:nacc@us.ibm.com] 
> Sent: Monday, January 17, 2005 3:06 PM
> To: raghavendra.koushik@s2io.com
> Cc: kernel-janitors@lists.osdl.org
> Subject: [PATCH 14/21] net/s2io: replace schedule_timeout() 
> with msleep()
> 
> Hi,
> 
> Please consider applying. 
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
> +			msleep(200);
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


--===============052496635207042397==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============052496635207042397==--
