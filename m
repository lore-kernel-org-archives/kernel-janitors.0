From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 30 Oct 2007 14:52:22 +0000
Subject: Re: [patch] standardising boolean variables in drivers/net (first
Message-Id: <47274526.8030204@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
In-Reply-To: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Lucas Woods wrote:
> First patch here, be gentle, please let me know if I've made a mess of th=
is :)
>
>
> Phase 1 standardised boolean variables in drivers/net
>
> --
> diff --git a/drivers/net/ipg.h b/drivers/net/ipg.h
> index d5d092c..f67b29b 100644
> --- a/drivers/net/ipg.h
> +++ b/drivers/net/ipg.h
> @@ -491,37 +491,37 @@ enum ipg_regs {
>   */
>
>  /* Miscellaneous Constants. */
> -#define   TRUE  1
> -#define   FALSE 0
> +#define   true  1
> +#define   false 0
>
>  /* Assign IPG_APPEND_FCS_ON_TX > 0 for auto FCS append on TX. */
> -#define         IPG_APPEND_FCS_ON_TX         TRUE
> +#define         IPG_APPEND_FCS_ON_TX         true
>
>  /* Assign IPG_APPEND_FCS_ON_TX > 0 for auto FCS strip on RX. */
> -#define         IPG_STRIP_FCS_ON_RX          TRUE
> +#define         IPG_STRIP_FCS_ON_RX          true
>
>  /* Assign IPG_DROP_ON_RX_ETH_ERRORS > 0 to drop RX frames with
>   * Ethernet errors.
>   */
> -#define         IPG_DROP_ON_RX_ETH_ERRORS    TRUE
> +#define         IPG_DROP_ON_RX_ETH_ERRORS    true
>
>  /* Assign IPG_INSERT_MANUAL_VLAN_TAG > 0 to insert VLAN tags manually
>   * (via TFC).
>   */
> -#define		IPG_INSERT_MANUAL_VLAN_TAG   FALSE
> +#define		IPG_INSERT_MANUAL_VLAN_TAG   false
>
>  /* Assign IPG_ADD_IPCHECKSUM_ON_TX > 0 for auto IP checksum on TX. */
> -#define         IPG_ADD_IPCHECKSUM_ON_TX     FALSE
> +#define         IPG_ADD_IPCHECKSUM_ON_TX     false
>
>  /* Assign IPG_ADD_TCPCHECKSUM_ON_TX > 0 for auto TCP checksum on TX.
>   * DO NOT USE FOR SILICON REVISIONS B3 AND EARLIER.
>   */
> -#define         IPG_ADD_TCPCHECKSUM_ON_TX    FALSE
> +#define         IPG_ADD_TCPCHECKSUM_ON_TX    false
>
>  /* Assign IPG_ADD_UDPCHECKSUM_ON_TX > 0 for auto UDP checksum on TX.
>   * DO NOT USE FOR SILICON REVISIONS B3 AND EARLIER.
>   */
> -#define         IPG_ADD_UDPCHECKSUM_ON_TX    FALSE
> +#define         IPG_ADD_UDPCHECKSUM_ON_TX    false
>
>  /* If inserting VLAN tags manually, assign the IPG_MANUAL_VLAN_xx
>   * constants as desired.
> diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
> index b8c0e7b..4c82b75 100644
> --- a/drivers/net/s2io.c
> +++ b/drivers/net/s2io.c
> @@ -1562,7 +1562,7 @@ static int init_nic(struct s2io_nic *nic)
>  	 * if it's not complete by then we return error.
>  	 */
>  	time =3D 0;
> -	while (TRUE) {
> +	while (true) {
>  		val64 =3D readq(&bar0->tti_command_mem);
>  		if (!(val64 & TTI_CMD_MEM_STROBE_NEW_CMD)) {
>  			break;
> @@ -1615,7 +1615,7 @@ static int init_nic(struct s2io_nic *nic)
>  		 * by then we return error.
>  		 */
>  		time =3D 0;
> -		while (TRUE) {
> +		while (true) {
>  			val64 =3D readq(&bar0->rti_command_mem);
>  			if (!(val64 & RTI_CMD_MEM_STROBE_NEW_CMD))
>  				break;
> @@ -1986,7 +1986,7 @@ static int verify_pcc_quiescent(struct s2io_nic
> *sp, int flag)
>
>  	herc =3D (sp->device_type =3D XFRAME_II_DEVICE);
>
> -	if (flag =3D FALSE) {
> +	if (flag =3D false) {
>  =20
Since it is a boolean, the 'not'-operand is more appropriate, so: "if=20
(!flag) {"
>  		if ((!herc && (sp->pdev->revision >=3D 4)) || herc) {
>  			if (!(val64 & ADAPTER_STATUS_RMAC_PCC_IDLE))
>  				ret =3D 1;
> @@ -3426,7 +3426,7 @@ static void s2io_reset(struct s2io_nic * sp)
>  	/* restore the previously assigned mac address */
>  	do_s2io_prog_unicast(sp->dev, (u8 *)&sp->def_mac_addr[0].mac_addr);
>
> -	sp->device_enabled_once =3D FALSE;
> +	sp->device_enabled_once =3D false;
>  }
>
>  /**
> @@ -5185,10 +5185,10 @@ static void s2io_ethtool_getpause_data(struct
> net_device *dev,
>
>  	val64 =3D readq(&bar0->rmac_pause_cfg);
>  	if (val64 & RMAC_PAUSE_GEN_ENABLE)
> -		ep->tx_pause =3D TRUE;
> +		ep->tx_pause =3D true;
>  	if (val64 & RMAC_PAUSE_RX_ENABLE)
> -		ep->rx_pause =3D TRUE;
> -	ep->autoneg =3D FALSE;
> +		ep->rx_pause =3D true;
> +	ep->autoneg =3D false;
>  }
>
>  /**
> @@ -6460,7 +6460,7 @@ static void s2io_set_link(struct work_struct *work)
>  					val64 |=3D ADAPTER_LED_ON;
>  					writeq(val64, &bar0->adapter_control);
>  				}
> -				nic->device_enabled_once =3D TRUE;
> +				nic->device_enabled_once =3D true;
>  			} else {
>  				DBG_PRINT(ERR_DBG, "%s: Error: ", dev->name);
>  				DBG_PRINT(ERR_DBG, "device is not Quiescent\n");
> @@ -7379,7 +7379,7 @@ s2io_init_nic(struct pci_dev *pdev, const struct
> pci_device_id *pre)
>  	struct s2io_nic *sp;
>  	struct net_device *dev;
>  	int i, j, ret;
> -	int dma_flag =3D FALSE;
> +	int dma_flag =3D false;
>  	u32 mac_up, mac_down;
>  	u64 val64 =3D 0, tmp64 =3D 0;
>  	struct XENA_dev_config __iomem *bar0 =3D NULL;
> @@ -7401,7 +7401,7 @@ s2io_init_nic(struct pci_dev *pdev, const struct
> pci_device_id *pre)
>
>  	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
>  		DBG_PRINT(INIT_DBG, "s2io_init_nic: Using 64bit DMA\n");
> -		dma_flag =3D TRUE;
> +		dma_flag =3D true;
>  		if (pci_set_consistent_dma_mask
>  		    (pdev, DMA_64BIT_MASK)) {
>  			DBG_PRINT(ERR_DBG,
> @@ -7440,7 +7440,7 @@ s2io_init_nic(struct pci_dev *pdev, const struct
> pci_device_id *pre)
>  	sp->dev =3D dev;
>  	sp->pdev =3D pdev;
>  	sp->high_dma_flag =3D dma_flag;
> -	sp->device_enabled_once =3D FALSE;
> +	sp->device_enabled_once =3D false;
>  	if (rx_ring_mode =3D 1)
>  		sp->rxd_mode =3D RXD_MODE_1;
>  	if (rx_ring_mode =3D 2)
> @@ -7577,7 +7577,7 @@ s2io_init_nic(struct pci_dev *pdev, const struct
> pci_device_id *pre)
>  #endif
>
>  	dev->features |=3D NETIF_F_SG | NETIF_F_IP_CSUM;
> -	if (sp->high_dma_flag =3D TRUE)
> +	if (sp->high_dma_flag =3D true)
>  =20
if (sp->high_dma_flag)
>  		dev->features |=3D NETIF_F_HIGHDMA;
>  	dev->features |=3D NETIF_F_TSO;
>  	dev->features |=3D NETIF_F_TSO6;
> diff --git a/drivers/net/s2io.h b/drivers/net/s2io.h
> index cc1797a..13abd8c 100644
> --- a/drivers/net/s2io.h
> +++ b/drivers/net/s2io.h
> @@ -22,9 +22,9 @@
>  #define BOOL    int
>  #endif
>  =20
Why not also take care of the variables of the type 'BOOL'?
> -#ifndef TRUE
> -#define TRUE    1
> -#define FALSE   0
> +#ifndef true
> +#define true    1
> +#define false   0
>  #endif
>
>  #undef SUCCESS
> diff --git a/drivers/net/skfp/h/targetos.h b/drivers/net/skfp/h/targetos.h
> index 5d940e7..b4b8398 100644
> --- a/drivers/net/skfp/h/targetos.h
> +++ b/drivers/net/skfp/h/targetos.h
> @@ -60,8 +60,8 @@
>
>  #include "h/hwmtm.h"
>
> -#define TRUE  1
> -#define FALSE 0
> +#define true  1
> +#define false 0
>
>  // HWM Definitions
>  // -----------------------
> diff --git a/drivers/net/skfp/skfddi.c b/drivers/net/skfp/skfddi.c
> index 7cf9b9f..e1d689c 100644
> --- a/drivers/net/skfp/skfddi.c
> +++ b/drivers/net/skfp/skfddi.c
> @@ -273,7 +273,7 @@ static int skfp_init_one(struct pci_dev *pdev,
>  	smc->os.dev =3D dev;
>  	smc->hw.slot =3D -1;
>  	smc->hw.iop =3D mem;
> -	smc->os.ResetRequested =3D FALSE;
> +	smc->os.ResetRequested =3D false;
>  	skb_queue_head_init(&smc->os.SendSkbQueue);
>
>  	dev->base_addr =3D (unsigned long)mem;
> @@ -639,7 +639,7 @@ irqreturn_t skfp_interrupt(int irq, void *dev_id)
>
>  	if (smc->os.ResetRequested) {
>  		ResetAdapter(smc);
> -		smc->os.ResetRequested =3D FALSE;
> +		smc->os.ResetRequested =3D false;
>  	}
>  	spin_unlock(&bp->DriverLock);
>  	STI_FBI();		// Enable IRQs from our adapter.
> @@ -2258,7 +2258,7 @@ void drv_reset_indication(struct s_smc *smc)
>  {
>  	PRINTK(KERN_INFO "entering drv_reset_indication\n");
>
> -	smc->os.ResetRequested =3D TRUE;	// Set flag.
> +	smc->os.ResetRequested =3D true;	// Set flag.
>
>  }				// drv_reset_indication
>
> diff --git a/drivers/net/tlan.c b/drivers/net/tlan.c
> index c99ce74..5f3a2c6 100644
> --- a/drivers/net/tlan.c
> +++ b/drivers/net/tlan.c
> @@ -2236,7 +2236,7 @@ TLan_ResetAdapter( struct net_device *dev )
>  	u32		data;
>  	u8		data8;
>
> -	priv->tlanFullDuplex =3D FALSE;
> +	priv->tlanFullDuplex =3D false;
>  	priv->phyOnline=3D0;
>  	netif_carrier_off(dev);
>
> @@ -2291,7 +2291,7 @@ TLan_ResetAdapter( struct net_device *dev )
>  			TLan_DioWrite8( dev->base_addr, TLAN_ACOMMIT, 0x0a );
>  		} else if ( priv->duplex =3D TLAN_DUPLEX_FULL ) {
>  			TLan_DioWrite8( dev->base_addr, TLAN_ACOMMIT, 0x00 );
> -			priv->tlanFullDuplex =3D TRUE;
> +			priv->tlanFullDuplex =3D true;
>  		} else {
>  			TLan_DioWrite8( dev->base_addr, TLAN_ACOMMIT, 0x08 );
>  		}
> @@ -2672,14 +2672,14 @@ void TLan_PhyStartLink( struct net_device *dev )
>  			TLan_MiiWriteReg( dev, phy, MII_GEN_CTL, 0x0000);
>  		} else if ( priv->speed =3D TLAN_SPEED_10 &&
>  			    priv->duplex =3D TLAN_DUPLEX_FULL) {
> -			priv->tlanFullDuplex =3D TRUE;
> +			priv->tlanFullDuplex =3D true;
>  			TLan_MiiWriteReg( dev, phy, MII_GEN_CTL, 0x0100);
>  		} else if ( priv->speed =3D TLAN_SPEED_100 &&
>  			    priv->duplex =3D TLAN_DUPLEX_HALF) {
>  			TLan_MiiWriteReg( dev, phy, MII_GEN_CTL, 0x2000);
>  		} else if ( priv->speed =3D TLAN_SPEED_100 &&
>  			    priv->duplex =3D TLAN_DUPLEX_FULL) {
> -			priv->tlanFullDuplex =3D TRUE;
> +			priv->tlanFullDuplex =3D true;
>  			TLan_MiiWriteReg( dev, phy, MII_GEN_CTL, 0x2100);
>  		} else {
>
> @@ -2716,7 +2716,7 @@ void TLan_PhyStartLink( struct net_device *dev )
>                  	tctl &=3D ~TLAN_TC_AUISEL;
>  			if ( priv->duplex =3D TLAN_DUPLEX_FULL ) {
>  				control |=3D MII_GC_DUPLEX;
> -				priv->tlanFullDuplex =3D TRUE;
> +				priv->tlanFullDuplex =3D true;
>  			}
>  			if ( priv->speed =3D TLAN_SPEED_100 ) {
>  				control |=3D MII_GC_SPEEDSEL;
> @@ -2771,9 +2771,9 @@ void TLan_PhyFinishAutoNeg( struct net_device *dev )
>  	TLan_MiiReadReg( dev, phy, MII_AN_LPA, &an_lpa );
>  	mode =3D an_adv & an_lpa & 0x03E0;
>  	if ( mode & 0x0100 ) {
> -		priv->tlanFullDuplex =3D TRUE;
> +		priv->tlanFullDuplex =3D true;
>  	} else if ( ! ( mode & 0x0080 ) && ( mode & 0x0040 ) ) {
> -		priv->tlanFullDuplex =3D TRUE;
> +		priv->tlanFullDuplex =3D true;
>  	}
>
>  	if ( ( ! ( mode & 0x0180 ) ) && ( priv->adapter->flags &
> TLAN_ADAPTER_USE_INTERN_10 ) && ( priv->phyNum !=3D 0 ) ) {
> @@ -2902,7 +2902,7 @@ int TLan_MiiReadReg( struct net_device *dev, u16
> phy, u16 reg, u16 *val )
>  	TLanPrivateInfo *priv =3D netdev_priv(dev);
>  	unsigned long flags =3D 0;
>
> -	err =3D FALSE;
> +	err =3D false;
>  	outw(TLAN_NET_SIO, dev->base_addr + TLAN_DIO_ADR);
>  	sio =3D dev->base_addr + TLAN_DIO_DATA + TLAN_NET_SIO;
>
> @@ -2935,7 +2935,7 @@ int TLan_MiiReadReg( struct net_device *dev, u16
> phy, u16 reg, u16 *val )
>  			TLan_SetBit(TLAN_NET_SIO_MCLK, sio);
>  		}
>  		tmp =3D 0xffff;
> -		err =3D TRUE;
> +		err =3D true;
>  	} else {					/* ACK, so read data */
>  		for (tmp =3D 0, i =3D 0x8000; i; i >>=3D 1) {
>  			TLan_ClearBit(TLAN_NET_SIO_MCLK, sio);
> diff --git a/drivers/net/tlan.h b/drivers/net/tlan.h
> index 41ce0b6..52cbb2a 100644
> --- a/drivers/net/tlan.h
> +++ b/drivers/net/tlan.h
> @@ -33,8 +33,8 @@
>  	 *
>  	 ****************************************************************/
>
> -#define FALSE			0
> -#define TRUE			1
> +#define false			0
> +#define true			1
>
>  #define TLAN_MIN_FRAME_SIZE	64
>  #define TLAN_MAX_FRAME_SIZE	1600
> diff --git a/drivers/net/wireless/wavelan_cs.c
> b/drivers/net/wireless/wavelan_cs.c
> index 577c647..58fc459 100644
> --- a/drivers/net/wireless/wavelan_cs.c
> +++ b/drivers/net/wireless/wavelan_cs.c
> @@ -867,7 +867,7 @@ wv_82593_cmd(struct net_device *	dev,
>        printk(KERN_INFO "wv_82593_cmd: %s timeout (previous command),
> status 0x%02x\n",
>  	     str, status);
>  #endif
> -      return(FALSE);
> +      return(false);
>      }
>
>    /* Issue the command to the controller */
> @@ -876,10 +876,10 @@ wv_82593_cmd(struct net_device *	dev,
>    /* If we don't have to check the result of the command
>     * Note : this mean that the irq handler will deal with that */
>    if(result =3D SR0_NO_RESULT)
> -    return(TRUE);
> +    return(true);
>
>    /* We are waiting for command completion */
> -  wait_completed =3D TRUE;
> +  wait_completed =3D true;
>
>    /* Busy wait while the LAN controller executes the command. */
>    spin =3D 1000;
> @@ -904,7 +904,7 @@ wv_82593_cmd(struct net_device *	dev,
>  	     !(status & SR0_RECEPTION))
>  	    {
>  	      /* Signal command completion */
> -	      wait_completed =3D FALSE;
> +	      wait_completed =3D false;
>  	    }
>  	  else
>  	    {
> @@ -925,7 +925,7 @@ wv_82593_cmd(struct net_device *	dev,
>        printk(KERN_INFO "wv_82593_cmd: %s timeout, status 0x%02x\n",
>  	     str, status);
>  #endif
> -      return(FALSE);
> +      return(false);
>      }
>
>    /* Check the return code returned by the card (see above) against
> @@ -936,10 +936,10 @@ wv_82593_cmd(struct net_device *	dev,
>        printk(KERN_INFO "wv_82593_cmd: %s failed, status =3D 0x%x\n",
>  	     str, status);
>  #endif
> -      return(FALSE);
> +      return(false);
>      }
>
> -  return(TRUE);
> +  return(true);
>  } /* wv_82593_cmd */
>
>  /*------------------------------------------------------------------*/
> @@ -1009,7 +1009,7 @@ wv_82593_reconfig(struct net_device *	dev)
>    unsigned long		flags;
>
>    /* Arm the flag, will be cleard in wv_82593_config() */
> -  lp->reconfig_82593 =3D TRUE;
> +  lp->reconfig_82593 =3D true;
>
>    /* Check if we can do it now ! */
>    if((link->open) && (netif_running(dev)) && !(netif_queue_stopped(dev)))
> @@ -3237,7 +3237,7 @@ wv_mmc_init(struct net_device *	dev)
>  	     dev->name, psa.psa_univ_mac_addr[0],
>  	     psa.psa_univ_mac_addr[1], psa.psa_univ_mac_addr[2]);
>  #endif
> -      return FALSE;
> +      return false;
>      }
>
>    /* Get the MAC address */
> @@ -3386,7 +3386,7 @@ wv_mmc_init(struct net_device *	dev)
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: <-wv_mmc_init()\n", dev->name);
>  #endif
> -  return TRUE;
> +  return true;
>  }
>
>  /*------------------------------------------------------------------*/
> @@ -3442,13 +3442,13 @@ wv_ru_stop(struct net_device *	dev)
>        printk(KERN_INFO "%s: wv_ru_stop(): The chip doesn't want to stop.=
..\n",
>  	     dev->name);
>  #endif
> -      return FALSE;
> +      return false;
>      }
>
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: <-wv_ru_stop()\n", dev->name);
>  #endif
> -  return TRUE;
> +  return true;
>  } /* wv_ru_stop */
>
>  /*------------------------------------------------------------------*/
> @@ -3475,7 +3475,7 @@ wv_ru_start(struct net_device *	dev)
>     * it down. First, we disable reception (in case it was already enable=
d).
>     */
>    if(!wv_ru_stop(dev))
> -    return FALSE;
> +    return false;
>
>    spin_lock_irqsave(&lp->spinlock, flags);
>
> @@ -3537,7 +3537,7 @@ wv_ru_start(struct net_device *	dev)
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: <-wv_ru_start()\n", dev->name);
>  #endif
> -  return TRUE;
> +  return true;
>  }
>
>  /*------------------------------------------------------------------*/
> @@ -3552,7 +3552,7 @@ wv_82593_config(struct net_device *	dev)
>    kio_addr_t			base =3D dev->base_addr;
>    net_local *			lp =3D netdev_priv(dev);
>    struct i82593_conf_block	cfblk;
> -  int				ret =3D TRUE;
> +  int				ret =3D true;
>  =20
bool?
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: ->wv_82593_config()\n", dev->name);
> @@ -3563,17 +3563,17 @@ wv_82593_config(struct net_device *	dev)
>     * Now conform to Wavelan document WCIN085B
>     */
>    memset(&cfblk, 0x00, sizeof(struct i82593_conf_block));
> -  cfblk.d6mod =3D FALSE;  	/* Run in i82593 advanced mode */
> +  cfblk.d6mod =3D false;  	/* Run in i82593 advanced mode */
>    cfblk.fifo_limit =3D 5;         /* =3D 56 B rx and 40 B tx fifo thresh=
olds */
> -  cfblk.forgnesi =3D FALSE;       /* 0=82C501, 1=3DAMD7992B compatibilit=
y */
> +  cfblk.forgnesi =3D false;       /* 0=82C501, 1=3DAMD7992B compatibilit=
y */
>    cfblk.fifo_32 =3D 1;
> -  cfblk.throttle_enb =3D FALSE;
> -  cfblk.contin =3D TRUE;          /* enable continuous mode */
> -  cfblk.cntrxint =3D FALSE;       /* enable continuous mode receive inte=
rrupts */
> +  cfblk.throttle_enb =3D false;
> +  cfblk.contin =3D true;          /* enable continuous mode */
> +  cfblk.cntrxint =3D false;       /* enable continuous mode receive inte=
rrupts */
>    cfblk.addr_len =3D WAVELAN_ADDR_SIZE;
> -  cfblk.acloc =3D TRUE;           /* Disable source addr insertion by i8=
2593 */
> +  cfblk.acloc =3D true;           /* Disable source addr insertion by i8=
2593 */
>    cfblk.preamb_len =3D 0;         /* 2 bytes preamble (SFD) */
> -  cfblk.loopback =3D FALSE;
> +  cfblk.loopback =3D false;
>    cfblk.lin_prio =3D 0;   	/* conform to 802.3 backoff algorithm */
>    cfblk.exp_prio =3D 5;	        /* conform to 802.3 backoff algorithm */
>    cfblk.bof_met =3D 1;	        /* conform to 802.3 backoff algorithm */
> @@ -3581,45 +3581,45 @@ wv_82593_config(struct net_device *	dev)
>    cfblk.slottim_low =3D 0x20 >> 5;	/* 32 bit times slot time */
>    cfblk.slottim_hi =3D 0x0;
>    cfblk.max_retr =3D 15;
> -  cfblk.prmisc =3D ((lp->promiscuous) ? TRUE: FALSE);	/* Promiscuous mod=
e */
> -  cfblk.bc_dis =3D FALSE;         /* Enable broadcast reception */
> -  cfblk.crs_1 =3D TRUE;		/* Transmit without carrier sense */
> -  cfblk.nocrc_ins =3D FALSE;	/* i82593 generates CRC */=09
> -  cfblk.crc_1632 =3D FALSE;	/* 32-bit Autodin-II CRC */
> -  cfblk.crs_cdt =3D FALSE;	/* CD not to be interpreted as CS */
> +  cfblk.prmisc =3D ((lp->promiscuous) ? true: false);	/* Promiscuous mod=
e */
>  =20
if lp->promiscuous is a bool, why not assign it as-is? Otherwise I think=20
it would be "correct" to write 'cfblk.prmisc =3D lp->promiscuous !=3D 0'=20
since that is the evaluation from the if-statement.
> +  cfblk.bc_dis =3D false;         /* Enable broadcast reception */
> +  cfblk.crs_1 =3D true;		/* Transmit without carrier sense */
> +  cfblk.nocrc_ins =3D false;	/* i82593 generates CRC */=09
> +  cfblk.crc_1632 =3D false;	/* 32-bit Autodin-II CRC */
> +  cfblk.crs_cdt =3D false;	/* CD not to be interpreted as CS */
>    cfblk.cs_filter =3D 0;  	/* CS is recognized immediately */
> -  cfblk.crs_src =3D FALSE;	/* External carrier sense */
> +  cfblk.crs_src =3D false;	/* External carrier sense */
>    cfblk.cd_filter =3D 0;  	/* CD is recognized immediately */
>    cfblk.min_fr_len =3D ETH_ZLEN >> 2;     /* Minimum frame length 64 byt=
es */
> -  cfblk.lng_typ =3D FALSE;	/* Length field > 1500 =3D type field */
> -  cfblk.lng_fld =3D TRUE; 	/* Disable 802.3 length field check */
> -  cfblk.rxcrc_xf =3D TRUE;	/* Don't transfer CRC to memory */
> -  cfblk.artx =3D TRUE;		/* Disable automatic retransmission */
> -  cfblk.sarec =3D TRUE;		/* Disable source addr trig of CD */
> -  cfblk.tx_jabber =3D TRUE;	/* Disable jabber jam sequence */
> -  cfblk.hash_1 =3D FALSE; 	/* Use bits 0-5 in mc address hash */
> -  cfblk.lbpkpol =3D TRUE; 	/* Loopback pin active high */
> -  cfblk.fdx =3D FALSE;		/* Disable full duplex operation */
> +  cfblk.lng_typ =3D false;	/* Length field > 1500 =3D type field */
> +  cfblk.lng_fld =3D true; 	/* Disable 802.3 length field check */
> +  cfblk.rxcrc_xf =3D true;	/* Don't transfer CRC to memory */
> +  cfblk.artx =3D true;		/* Disable automatic retransmission */
> +  cfblk.sarec =3D true;		/* Disable source addr trig of CD */
> +  cfblk.tx_jabber =3D true;	/* Disable jabber jam sequence */
> +  cfblk.hash_1 =3D false; 	/* Use bits 0-5 in mc address hash */
> +  cfblk.lbpkpol =3D true; 	/* Loopback pin active high */
> +  cfblk.fdx =3D false;		/* Disable full duplex operation */
>    cfblk.dummy_6 =3D 0x3f; 	/* all ones */
> -  cfblk.mult_ia =3D FALSE;	/* No multiple individual addresses */
> -  cfblk.dis_bof =3D FALSE;	/* Disable the backoff algorithm ?! */
> -  cfblk.dummy_1 =3D TRUE; 	/* set to 1 */
> +  cfblk.mult_ia =3D false;	/* No multiple individual addresses */
> +  cfblk.dis_bof =3D false;	/* Disable the backoff algorithm ?! */
> +  cfblk.dummy_1 =3D true; 	/* set to 1 */
>    cfblk.tx_ifs_retrig =3D 3;	/* Hmm... Disabled */
>  #ifdef MULTICAST_ALL
> -  cfblk.mc_all =3D (lp->allmulticast ? TRUE: FALSE);	/* Allow all multic=
asts */
> +  cfblk.mc_all =3D (lp->allmulticast ? true: false);	/* Allow all multic=
asts */
>  =20
Same here..
>  #else
> -  cfblk.mc_all =3D FALSE;		/* No multicast all mode */
> +  cfblk.mc_all =3D false;		/* No multicast all mode */
>  #endif
>    cfblk.rcv_mon =3D 0;		/* Monitor mode disabled */
> -  cfblk.frag_acpt =3D TRUE;	/* Do not accept fragments */
> -  cfblk.tstrttrs =3D FALSE;	/* No start transmission threshold */
> -  cfblk.fretx =3D TRUE;		/* FIFO automatic retransmission */
> -  cfblk.syncrqs =3D FALSE; 	/* Synchronous DRQ deassertion... */
> -  cfblk.sttlen =3D TRUE;  	/* 6 byte status registers */
> -  cfblk.rx_eop =3D TRUE;  	/* Signal EOP on packet reception */
> -  cfblk.tx_eop =3D TRUE;  	/* Signal EOP on packet transmission */
> +  cfblk.frag_acpt =3D true;	/* Do not accept fragments */
> +  cfblk.tstrttrs =3D false;	/* No start transmission threshold */
> +  cfblk.fretx =3D true;		/* FIFO automatic retransmission */
> +  cfblk.syncrqs =3D false; 	/* Synchronous DRQ deassertion... */
> +  cfblk.sttlen =3D true;  	/* 6 byte status registers */
> +  cfblk.rx_eop =3D true;  	/* Signal EOP on packet reception */
> +  cfblk.tx_eop =3D true;  	/* Signal EOP on packet transmission */
>    cfblk.rbuf_size =3D RX_SIZE>>11;	/* Set receive buffer size */
> -  cfblk.rcvstop =3D TRUE; 	/* Enable Receive Stop Register */
> +  cfblk.rcvstop =3D true; 	/* Enable Receive Stop Register */
>  =20
Is all of there booleans?
>  #ifdef DEBUG_I82593_SHOW
>    {
> @@ -3647,7 +3647,7 @@ wv_82593_config(struct net_device *	dev)
>    hacr_write(base, HACR_DEFAULT);
>    if(!wv_82593_cmd(dev, "wv_82593_config(): configure",
>  		   OP0_CONFIGURE, SR0_CONFIGURE_DONE))
> -    ret =3D FALSE;
> +    ret =3D false;
>
>    /* Initialize adapter's ethernet MAC address */
>    outb(TX_BASE & 0xff, PIORL(base));
> @@ -3661,7 +3661,7 @@ wv_82593_config(struct net_device *	dev)
>    hacr_write(base, HACR_DEFAULT);
>    if(!wv_82593_cmd(dev, "wv_82593_config(): ia-setup",
>  		   OP0_IA_SETUP, SR0_IA_SETUP_DONE))
> -    ret =3D FALSE;
> +    ret =3D false;
>
>  #ifdef WAVELAN_ROAMING
>      /* If roaming is enabled, join the "Beacon Request" multicast group.=
.. */
> @@ -3698,12 +3698,12 @@ wv_82593_config(struct net_device *	dev)
>        hacr_write(base, HACR_DEFAULT);
>        if(!wv_82593_cmd(dev, "wv_82593_config(): mc-setup",
>  		       OP0_MC_SETUP, SR0_MC_SETUP_DONE))
> -	ret =3D FALSE;
> +	ret =3D false;
>        lp->mc_count =3D dev->mc_count;	/* remember to avoid repeated rese=
t */
>      }
>
>    /* Job done, clear the flag */
> -  lp->reconfig_82593 =3D FALSE;
> +  lp->reconfig_82593 =3D false;
>
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: <-wv_82593_config()\n", dev->name);
> @@ -3735,7 +3735,7 @@ wv_pcmcia_reset(struct net_device *	dev)
>    if(i !=3D CS_SUCCESS)
>      {
>        cs_error(link, AccessConfigurationRegister, i);
> -      return FALSE;
> +      return false;
>      }
>
>  #ifdef DEBUG_CONFIG_INFO
> @@ -3749,7 +3749,7 @@ wv_pcmcia_reset(struct net_device *	dev)
>    if(i !=3D CS_SUCCESS)
>      {
>        cs_error(link, AccessConfigurationRegister, i);
> -      return FALSE;
> +      return false;
>      }
>
>    reg.Action =3D CS_WRITE;
> @@ -3758,13 +3758,13 @@ wv_pcmcia_reset(struct net_device *	dev)
>    if(i !=3D CS_SUCCESS)
>      {
>        cs_error(link, AccessConfigurationRegister, i);
> -      return FALSE;
> +      return false;
>      }
>
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: <-wv_pcmcia_reset()\n", dev->name);
>  #endif
> -  return TRUE;
> +  return true;
>  }
>
>  /*------------------------------------------------------------------*/
> @@ -3788,7 +3788,7 @@ wv_hw_config(struct net_device *	dev)
>    net_local *		lp =3D netdev_priv(dev);
>    kio_addr_t		base =3D dev->base_addr;
>    unsigned long		flags;
> -  int			ret =3D FALSE;
> +  int			ret =3D false;
>
>  #ifdef DEBUG_CONFIG_TRACE
>    printk(KERN_DEBUG "%s: ->wv_hw_config()\n", dev->name);
> @@ -3799,13 +3799,13 @@ wv_hw_config(struct net_device *	dev)
>      {
>        printk(KERN_WARNING "%s: wv_hw_config: structure/compiler
> botch: \"%s\"\n",
>  	     dev->name, wv_structuct_check());
> -      return FALSE;
> +      return false;
>      }
>  #endif	/* STRUCT_CHECK =3D 1 */
>
>    /* Reset the pcmcia interface */
> -  if(wv_pcmcia_reset(dev) =3D FALSE)
> -    return FALSE;
> +  if(wv_pcmcia_reset(dev) =3D false)
> +    return false;
>  =20
Apart from the "=3D false", is wv_pcmcia_reset() returning a boolean?

Alright, "snipping" the rest of the mail. Seems that you have made a=20
"s/FALSE/false" conversion. I am bit confused that you could compile=20
with the "#define false", did it not even warn about it?
(btw, please try the script/checkpatch.pl on your patches, since it=20
promotes style-improvements on the lines your patch effects).

cu
Richard Knutsson

-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
