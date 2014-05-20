From: walter harms <wharms@bfs.de>
Date: Tue, 20 May 2014 12:49:42 +0000
Subject: Re: [PATCH] staging: gdm72xx: code cleanup
Message-Id: <537B4F66.6050300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82418154.pK7JjuYCz5@mayhem>
In-Reply-To: <82418154.pK7JjuYCz5@mayhem>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 20.05.2014 13:52, schrieb Gengis Dave:
> Checkpatch.pl cleanup
> Fixed coding style
> Removed useless return
> Removed useless braces
> 
> Signed-off-by: Davide Gianforte <root@gengisdave.org>
> ---
> 
>  drivers/staging/gdm72xx/gdm_qos.c   | 15 ++++++------
>  drivers/staging/gdm72xx/gdm_sdio.c  | 18 ++++++--------
>  drivers/staging/gdm72xx/gdm_usb.c   | 29 +++++++++++-----------
>  drivers/staging/gdm72xx/gdm_wimax.c | 49 +++++++++++++++++++------------------
>  drivers/staging/gdm72xx/netlink_k.c | 13 +++++-----
>  drivers/staging/gdm72xx/usb_boot.c  |  8 +++---
>  6 files changed, 65 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/staging/gdm72xx/gdm_qos.c b/drivers/staging/gdm72xx/gdm_qos.c
> index eba3bfa..d9fec36 100644
> --- a/drivers/staging/gdm72xx/gdm_qos.c
> +++ b/drivers/staging/gdm72xx/gdm_qos.c
> @@ -47,7 +47,8 @@ static void *alloc_qos_entry(void)
>  
>  	spin_lock_irqsave(&qos_free_list.lock, flags);
>  	if (qos_free_list.cnt) {
> -		entry = list_entry(qos_free_list.head.prev, struct qos_entry_s, list);
> +		entry = list_entry(qos_free_list.head.prev, struct qos_entry_s,
> +				   list);
>  		list_del(&entry->list);
>  		qos_free_list.cnt--;
>  		spin_unlock_irqrestore(&qos_free_list.lock, flags);
> @@ -228,7 +229,8 @@ static u32 extract_qos_list(struct nic *nic, struct list_head *head)
>  		if (list_empty(&qcb->qos_list[i]))
>  			continue;
>  
> -		entry = list_entry(qcb->qos_list[i].prev, struct qos_entry_s, list);
> +		entry = list_entry(qcb->qos_list[i].prev, struct qos_entry_s,
> +				   list);
>  
>  		list_move_tail(&entry->list, head);
>  		qcb->csr[i].qos_buf_count++;
> @@ -307,19 +309,17 @@ static u32 get_csr(struct qos_cb_s *qcb, u32 SFID, int mode)
>  {
>  	int i;
>  
> -	for (i = 0; i < qcb->qos_list_cnt; i++) {
> +	for (i = 0; i < qcb->qos_list_cnt; i++)
>  		if (qcb->csr[i].SFID = SFID)
>  			return i;
> -	}
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
>  	}
>  	return -1;
>  }
> @@ -430,7 +430,8 @@ void gdm_recv_qos_hci_packet(void *nic_ptr, u8 *buf, int size)
>  		qcb->qos_list_cnt--;
>  		qcb->qos_limit_size = 254/qcb->qos_list_cnt;
>  
> -		list_for_each_entry_safe(entry, n, &qcb->qos_list[index], list) {
> +		list_for_each_entry_safe(entry, n, &qcb->qos_list[index],
> +					 list) {
>  			list_move_tail(&entry->list, &free_list);
>  		}
>  		spin_unlock_irqrestore(&qcb->qos_lock, flags);
> diff --git a/drivers/staging/gdm72xx/gdm_sdio.c b/drivers/staging/gdm72xx/gdm_sdio.c
> index 6d1de33..90cd1b1 100644
> --- a/drivers/staging/gdm72xx/gdm_sdio.c
> +++ b/drivers/staging/gdm72xx/gdm_sdio.c
> @@ -126,7 +126,7 @@ static void put_rx_struct(struct rx_cxt *rx, struct sdio_rx *r)
>  
>  static int init_sdio(struct sdiowm_dev *sdev)
>  {
> -	int ret = 0, i;
> +	int i;
>  	struct tx_cxt *tx = &sdev->tx;
>  	struct rx_cxt *rx = &sdev->rx;
>  	struct sdio_tx *t;
> @@ -144,10 +144,8 @@ static int init_sdio(struct sdiowm_dev *sdev)
>  
>  	for (i = 0; i < MAX_NR_SDU_BUF; i++) {
>  		t = alloc_tx_struct(tx);
> -		if (t = NULL) {
> -			ret = -ENOMEM;
> +		if (t = NULL)
>  			goto fail;
> -		}
>  		list_add(&t->list, &tx->free_list);
>  	}
>  
> @@ -158,10 +156,8 @@ static int init_sdio(struct sdiowm_dev *sdev)
>  
>  	for (i = 0; i < MAX_NR_RX_BUF; i++) {
>  		r = alloc_rx_struct(rx);
> -		if (r = NULL) {
> -			ret = -ENOMEM;
> +		if (r = NULL)
>  			goto fail;
> -		}
>  		list_add(&r->list, &rx->free_list);
>  	}
>  
> @@ -173,7 +169,7 @@ static int init_sdio(struct sdiowm_dev *sdev)
>  
>  fail:
>  	release_sdio(sdev);
> -	return ret;
> +	return -ENOMEM;
>  }
>  
>  static void release_sdio(struct sdiowm_dev *sdev)
> @@ -312,7 +308,8 @@ static void send_sdu(struct sdio_func *func, struct tx_cxt *tx)
>  	spin_unlock_irqrestore(&tx->lock, flags);
>  }
>  
> -static void send_hci(struct sdio_func *func, struct tx_cxt *tx, struct sdio_tx *t)
> +static void send_hci(struct sdio_func *func, struct tx_cxt *tx,
> +		     struct sdio_tx *t)
>  {
>  	unsigned long flags;
>  
> @@ -601,7 +598,8 @@ static int gdm_sdio_receive(void *priv_dev,
>  	return 0;
>  }
>  
> -static int sdio_wimax_probe(struct sdio_func *func, const struct sdio_device_id *id)
> +static int sdio_wimax_probe(struct sdio_func *func,
> +			    const struct sdio_device_id *id)
>  {
>  	int ret;
>  	struct phy_dev *phy_dev = NULL;
> diff --git a/drivers/staging/gdm72xx/gdm_usb.c b/drivers/staging/gdm72xx/gdm_usb.c
> index c59a7a4..dccdf6e 100644
> --- a/drivers/staging/gdm72xx/gdm_usb.c
> +++ b/drivers/staging/gdm72xx/gdm_usb.c
> @@ -166,7 +166,7 @@ static void put_rx_struct(struct rx_cxt *rx, struct usb_rx *r)
>  
>  static int init_usb(struct usbwm_dev *udev)
>  {
> -	int ret = 0, i;
> +	int i;
>  	struct tx_cxt *tx = &udev->tx;
>  	struct rx_cxt *rx = &udev->rx;
>  	struct usb_tx *t;
> @@ -191,7 +191,6 @@ static int init_usb(struct usbwm_dev *udev)
>  		t = alloc_tx_struct(tx);
>  		if (t = NULL) {
>  			spin_unlock_irqrestore(&tx->lock, flags);
> -			ret = -ENOMEM;
>  			goto fail;
>  		}
>  		list_add(&t->list, &tx->free_list);
> @@ -199,19 +198,17 @@ static int init_usb(struct usbwm_dev *udev)
>  	spin_unlock_irqrestore(&tx->lock, flags);
>  
>  	r = alloc_rx_struct(rx);
> -	if (r = NULL) {
> -		ret = -ENOMEM;
> +	if (r = NULL)
>  		goto fail;
> -	}
>  
>  	spin_lock_irqsave(&rx->lock, flags);
>  	list_add(&r->list, &rx->free_list);
>  	spin_unlock_irqrestore(&rx->lock, flags);
> -	return ret;
> +	return 0;
>  
>  fail:
>  	release_usb(udev);
> -	return ret;
> +	return -ENOMEM;
>  }
>  
>  static void release_usb(struct usbwm_dev *udev)
> @@ -527,7 +524,8 @@ static void do_pm_control(struct work_struct *work)
>  }
>  #endif /* CONFIG_WIMAX_GDM72XX_USB_PM */
>  
> -static int gdm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +static int gdm_usb_probe(struct usb_interface *intf,
> +			 const struct usb_device_id *id)
>  {
>  	int ret = 0;
>  	u8 bConfigurationValue;
> @@ -556,7 +554,8 @@ static int gdm_usb_probe(struct usb_interface *intf, const struct usb_device_id
>  	}
>  
>  	/* Support for EEPROM bootloader */
> -	if (bConfigurationValue = DOWNLOAD_CONF_VALUE || idProduct & B_DOWNLOAD) {
> +	if (bConfigurationValue = DOWNLOAD_CONF_VALUE ||
> +	    idProduct & B_DOWNLOAD) {
>  		ret = usb_boot(usbdev, bcdDevice);
>  		goto out;
>  	}
> @@ -607,9 +606,8 @@ out:
>  		kfree(phy_dev);
>  		kfree(udev);
>  		usb_put_dev(usbdev);
> -	} else {
> +	} else
>  		usb_set_intfdata(intf, phy_dev);
> -	}
>  	return ret;
>  }
>  
> @@ -628,7 +626,8 @@ static void gdm_usb_disconnect(struct usb_interface *intf)
>  	idProduct = L2H(usbdev->descriptor.idProduct);
>  
>  	if (idProduct != EMERGENCY_PID &&
> -	    bConfigurationValue != DOWNLOAD_CONF_VALUE && (idProduct & B_DOWNLOAD) = 0) {
> +	    bConfigurationValue != DOWNLOAD_CONF_VALUE &&
> +	    (idProduct & B_DOWNLOAD) = 0) {
>  
>  		udev = phy_dev->priv_dev;
>  		udev->usbdev = NULL;
> @@ -731,7 +730,8 @@ static int k_mode_thread(void *arg)
>  
>  			spin_lock_irqsave(&tx->lock, flags);
>  
> -			list_for_each_entry_safe(t, temp, &tx->pending_list, p_list) {
> +			list_for_each_entry_safe(t, temp, &tx->pending_list,
> +						 p_list) {
>  				list_del(&t->p_list);
>  				ret = usb_submit_urb(t->urb, GFP_ATOMIC);
>  
> @@ -747,7 +747,8 @@ static int k_mode_thread(void *arg)
>  			spin_lock_irqsave(&k_lock, flags2);
>  		}
>  		wait_event_interruptible_lock_irq(k_wait,
> -						  !list_empty(&k_list) || k_mode_stop,
> +						  !list_empty(&k_list) ||
> +						  k_mode_stop,
>  						  k_lock);
>  		spin_unlock_irqrestore(&k_lock, flags2);
>  	}
> diff --git a/drivers/staging/gdm72xx/gdm_wimax.c b/drivers/staging/gdm72xx/gdm_wimax.c
> index 492bc78..4f8de0e 100644
> --- a/drivers/staging/gdm72xx/gdm_wimax.c
> +++ b/drivers/staging/gdm72xx/gdm_wimax.c
> @@ -167,7 +167,6 @@ static inline int gdm_wimax_header(struct sk_buff **pskb)
>  {
>  	u16 buf[HCI_HEADER_SIZE / sizeof(u16)];
>  	struct sk_buff *skb = *pskb;
> -	int ret = 0;
>  
>  	if (unlikely(skb_headroom(skb) < HCI_HEADER_SIZE)) {
>  		struct sk_buff *skb2;
> @@ -187,7 +186,7 @@ static inline int gdm_wimax_header(struct sk_buff **pskb)
>  	memcpy(skb->data, buf, HCI_HEADER_SIZE);
>  
>  	*pskb = skb;
> -	return ret;
> +	return 0;
>  }
>  
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
>  		e = list_entry(wm_event.freeq.next, struct evt_entry, list);
>  		list_del(&e->list);
>  	}
> @@ -282,7 +281,7 @@ static void put_event_entry(struct evt_entry *e)
>  
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

perhaps you should check that return value
otherwise you could cast to void.


>  		netlink_send(wm_event.sock, idx, 0, e->evt_data, e->size);
>  
>  		spin_lock_irqsave(&wm_event.evt_lock, flags);
> @@ -347,7 +346,8 @@ int gdm_wimax_send_tx(struct sk_buff *skb, struct net_device *dev)
>  	int ret = 0;
>  	struct nic *nic = netdev_priv(dev);
>  
> -	ret = gdm_wimax_send_with_cb(nic, skb->data, skb->len, tx_complete, nic);
> +	ret = gdm_wimax_send_with_cb(nic, skb->data, skb->len, tx_complete,
> +				     nic);
>  	if (ret = -ENOSPC) {
>  		netif_stop_queue(dev);
>  		ret = 0;
> @@ -536,16 +536,17 @@ static void gdm_wimax_cleanup_ioctl(struct net_device *dev)
>  static void gdm_update_fsm(struct net_device *dev, struct fsm_s *new_fsm)
>  {
>  	struct nic *nic = netdev_priv(dev);
> -	struct fsm_s *cur_fsm = (struct fsm_s *)nic->sdk_data[SIOC_DATA_FSM].buf;
> +	struct fsm_s *cur_fsm = (struct fsm_s *)
> +					nic->sdk_data[SIOC_DATA_FSM].buf;
>  
>  	if (!cur_fsm)
>  		return;
>  
>  	if (cur_fsm->m_status != new_fsm->m_status ||
>  	    cur_fsm->c_status != new_fsm->c_status) {
> -		if (new_fsm->m_status = M_CONNECTED) {
> +		if (new_fsm->m_status = M_CONNECTED)
>  			netif_carrier_on(dev);
> -		} else if (cur_fsm->m_status = M_CONNECTED) {
> +		else if (cur_fsm->m_status = M_CONNECTED) {
>  			netif_carrier_off(dev);
>  			#if defined(CONFIG_WIMAX_GDM72XX_QOS)
>  			gdm_qos_release_list(nic);
> @@ -573,16 +574,16 @@ static int gdm_wimax_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
>  			return -EOPNOTSUPP;
>  		}
>  		if (req->cmd = SIOCG_DATA) {
> -			ret = gdm_wimax_ioctl_get_data(&req->data,
> -						       &nic->sdk_data[req->data_id]);
> +			ret = gdm_wimax_ioctl_get_data(
> +				&req->data, &nic->sdk_data[req->data_id]);
>  			if (ret < 0)
>  				return ret;
>  		} else if (req->cmd = SIOCS_DATA) {
> -			if (req->data_id = SIOC_DATA_FSM) {
> +			if (req->data_id = SIOC_DATA_FSM)
>  				/*NOTE: gdm_update_fsm should be called
>  				before gdm_wimax_ioctl_set_data is called*/
> -				gdm_update_fsm(dev, (struct fsm_s *)req->data.buf);
> -			}
> +				gdm_update_fsm(dev,
> +					       (struct fsm_s *)req->data.buf);
>  			ret = gdm_wimax_ioctl_set_data(
>  				&nic->sdk_data[req->data_id], &req->data);
>  			if (ret < 0)
> @@ -658,7 +659,8 @@ static int gdm_wimax_hci_get_tlv(u8 *buf, u8 *T, u16 *L, u8 **V)
>  	return next_pos;
>  }
>  
> -static int gdm_wimax_get_prepared_info(struct net_device *dev, char *buf, int len)
> +static int gdm_wimax_get_prepared_info(struct net_device *dev, char *buf,
> +				       int len)
>  {
>  	u8 T, *V;
>  	u16 L;
> @@ -748,10 +750,9 @@ static void gdm_wimax_transmit_aggr_pkt(struct net_device *dev, char *buf,
>  		length = B2H(hci->length);
>  		gdm_wimax_netif_rx(dev, hci->data, length);
>  
> -		if (length & 0x3) {
> +		if (length & 0x3)
>  			/* Add padding size */
>  			length += HCI_PADDING_BYTE - (length & 0x3);
> -		}

is that if() needed at all ?



>  		length += HCI_HEADER_SIZE + HCI_RESERVED_BYTE;
>  		len -= length;
> @@ -782,7 +783,8 @@ static void gdm_wimax_transmit_pkt(struct net_device *dev, char *buf, int len)
>  
>  	switch (cmd_evt) {
>  	case WIMAX_RX_SDU_AGGR:
> -		gdm_wimax_transmit_aggr_pkt(dev, &buf[HCI_HEADER_SIZE], cmd_len);
> +		gdm_wimax_transmit_aggr_pkt(dev, &buf[HCI_HEADER_SIZE],
> +					    cmd_len);
>  		break;
>  	case WIMAX_RX_SDU:
>  		gdm_wimax_netif_rx(dev, &buf[HCI_HEADER_SIZE], cmd_len);
> @@ -793,13 +795,12 @@ static void gdm_wimax_transmit_pkt(struct net_device *dev, char *buf, int len)
>  		break;
>  	#endif
>  	case WIMAX_SDU_TX_FLOW:
> -		if (buf[4] = 0) {
> +		if (buf[4] = 0)
>  			if (!netif_queue_stopped(dev))
>  				netif_stop_queue(dev);
> -		} else if (buf[4] = 1) {
> +		else if (buf[4] = 1)
>  			if (netif_queue_stopped(dev))
>  				netif_wake_queue(dev);
> -		}
>  		break;
>  	default:
>  		gdm_wimax_event_send(dev, buf, len);
> @@ -851,9 +852,9 @@ static void prepare_rx_complete(void *arg, void *data, int len)
>  	int ret;
>  
>  	ret = gdm_wimax_get_prepared_info(nic->netdev, data, len);
> -	if (ret = 1) {
> +	if (ret = 1)
>  		gdm_wimax_rcv_with_cb(nic, rx_complete, nic);
> -	} else {
> +	else {
>  		if (ret < 0)
>  			netdev_err(nic->netdev,
>  				   "get_prepared_info failed(%d)\n", ret);
> diff --git a/drivers/staging/gdm72xx/netlink_k.c b/drivers/staging/gdm72xx/netlink_k.c
> index 06f7b13..38277ce 100644
> --- a/drivers/staging/gdm72xx/netlink_k.c
> +++ b/drivers/staging/gdm72xx/netlink_k.c
> @@ -55,7 +55,8 @@ static void netlink_rcv_cb(struct sk_buff *skb)
>  	if (skb->len >= NLMSG_HDRLEN) {
>  		nlh = (struct nlmsghdr *)skb->data;
>  
> -		if (skb->len < nlh->nlmsg_len || nlh->nlmsg_len > ND_MAX_MSG_LEN) {
> +		if (skb->len < nlh->nlmsg_len ||
> +		    nlh->nlmsg_len > ND_MAX_MSG_LEN) {
>  			netdev_err(skb->dev, "Invalid length (%d,%d)\n",
>  				   skb->len, nlh->nlmsg_len);
>  			return;
> @@ -74,9 +75,8 @@ static void netlink_rcv_cb(struct sk_buff *skb)
>  				netdev_err(skb->dev,
>  					   "dev_get_by_index(%d) is not found.\n",
>  					   ifindex);
> -		} else {
> +		} else
>  			netdev_err(skb->dev, "Unregistered Callback\n");
> -		}
>  	}
>  }
>  
> @@ -144,13 +144,12 @@ int netlink_send(struct sock *sock, int group, u16 type, void *msg, int len)
>  
>  	ret = netlink_broadcast(sock, skb, 0, group+1, GFP_ATOMIC);
>  
> -	if (!ret) {
> +	if (!ret)
>  		return len;
> -	} else {
> -		if (ret != -ESRCH) {
> +	else {
> +		if (ret != -ESRCH)
>  			pr_err("netlink_broadcast g=%d, t=%d, l=%d, r=%d\n",
>  			       group, type, len, ret);
> -		}
>  		ret = 0;
>  	}
>  	return ret;
> diff --git a/drivers/staging/gdm72xx/usb_boot.c b/drivers/staging/gdm72xx/usb_boot.c
> index 75149d7..d59bac8 100644
> --- a/drivers/staging/gdm72xx/usb_boot.c
> +++ b/drivers/staging/gdm72xx/usb_boot.c
> @@ -106,7 +106,8 @@ static int gdm_wibro_recv(struct usb_device *usbdev, void *data, int len)
>  	return 0;
>  }
>  
> -static int download_image(struct usb_device *usbdev, const struct firmware *firm,
> +static int download_image(struct usb_device *usbdev,
> +			  const struct firmware *firm,
>  			  loff_t pos, u32 img_len, u32 magic_num)
>  {
>  	struct dn_header h;
> @@ -332,11 +333,8 @@ out:
>  
>  static int em_fw_reset(struct usb_device *usbdev)
>  {
> -	int ret;
> -
>  	/*Send ZLP*/
> -	ret = gdm_wibro_send(usbdev, NULL, 0);
> -	return ret;
> +	return gdm_wibro_send(usbdev, NULL, 0);
>  }
>  
>  int usb_emergency(struct usb_device *usbdev)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
