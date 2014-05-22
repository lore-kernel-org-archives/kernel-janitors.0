From: Gengis Dave <root@gengisdave.org>
Date: Thu, 22 May 2014 23:05:53 +0000
Subject: [PATCH 1/2] staging: gdm72xx: code cleanup
Message-Id: <8099850.Voxa4knWsb@mayhem>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Checkpatch.pl cleanup

Signed-off-by: Davide Gianforte <davide@gengisdave.org>
---

 drivers/staging/gdm72xx/gdm_qos.c   |  9 ++++++---
 drivers/staging/gdm72xx/gdm_sdio.c  |  6 ++++--
 drivers/staging/gdm72xx/gdm_usb.c   | 16 ++++++++++------
 drivers/staging/gdm72xx/gdm_wimax.c | 19 ++++++++++++-------
 drivers/staging/gdm72xx/netlink_k.c |  3 ++-
 drivers/staging/gdm72xx/usb_boot.c  |  3 ++-
 6 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/gdm72xx/gdm_qos.c 
b/drivers/staging/gdm72xx/gdm_qos.c
index eba3bfa..df6f000 100644
--- a/drivers/staging/gdm72xx/gdm_qos.c
+++ b/drivers/staging/gdm72xx/gdm_qos.c
@@ -47,7 +47,8 @@ static void *alloc_qos_entry(void)
 
        spin_lock_irqsave(&qos_free_list.lock, flags);
        if (qos_free_list.cnt) {
-               entry = list_entry(qos_free_list.head.prev, struct 
qos_entry_s, list);
+               entry = list_entry(qos_free_list.head.prev, struct 
qos_entry_s,
+                                  list);
                list_del(&entry->list);
                qos_free_list.cnt--;
                spin_unlock_irqrestore(&qos_free_list.lock, flags);
@@ -228,7 +229,8 @@ static u32 extract_qos_list(struct nic *nic, struct 
list_head *head)
                if (list_empty(&qcb->qos_list[i]))
                        continue;
 
-               entry = list_entry(qcb->qos_list[i].prev, struct qos_entry_s, 
list);
+               entry = list_entry(qcb->qos_list[i].prev, struct qos_entry_s,
+                                  list);
 
                list_move_tail(&entry->list, head);
                qcb->csr[i].qos_buf_count++;
@@ -430,7 +432,8 @@ void gdm_recv_qos_hci_packet(void *nic_ptr, u8 *buf, int 
size)
                qcb->qos_list_cnt--;
                qcb->qos_limit_size = 254/qcb->qos_list_cnt;
 
-               list_for_each_entry_safe(entry, n, &qcb->qos_list[index], 
list) {
+               list_for_each_entry_safe(entry, n, &qcb->qos_list[index],
+                                        list) {
                        list_move_tail(&entry->list, &free_list);
                }
                spin_unlock_irqrestore(&qcb->qos_lock, flags);
diff --git a/drivers/staging/gdm72xx/gdm_sdio.c 
b/drivers/staging/gdm72xx/gdm_sdio.c
index 6d1de33..7398d45 100644
--- a/drivers/staging/gdm72xx/gdm_sdio.c
+++ b/drivers/staging/gdm72xx/gdm_sdio.c
@@ -312,7 +312,8 @@ static void send_sdu(struct sdio_func *func, struct tx_cxt 
*tx)
        spin_unlock_irqrestore(&tx->lock, flags);
 }
 
-static void send_hci(struct sdio_func *func, struct tx_cxt *tx, struct 
sdio_tx *t)
+static void send_hci(struct sdio_func *func, struct tx_cxt *tx,
+                    struct sdio_tx *t)
 {
        unsigned long flags;
 
@@ -601,7 +602,8 @@ static int gdm_sdio_receive(void *priv_dev,
        return 0;
 }
 
-static int sdio_wimax_probe(struct sdio_func *func, const struct 
sdio_device_id *id)
+static int sdio_wimax_probe(struct sdio_func *func,
+                           const struct sdio_device_id *id)
 {
        int ret;
        struct phy_dev *phy_dev = NULL;
diff --git a/drivers/staging/gdm72xx/gdm_usb.c 
b/drivers/staging/gdm72xx/gdm_usb.c
index c59a7a4..78d6667 100644
--- a/drivers/staging/gdm72xx/gdm_usb.c
+++ b/drivers/staging/gdm72xx/gdm_usb.c
@@ -527,7 +527,8 @@ static void do_pm_control(struct work_struct *work)
 }
 #endif /* CONFIG_WIMAX_GDM72XX_USB_PM */
 
-static int gdm_usb_probe(struct usb_interface *intf, const struct 
usb_device_id *id)
+static int gdm_usb_probe(struct usb_interface *intf,
+                        const struct usb_device_id *id)
 {
        int ret = 0;
        u8 bConfigurationValue;
@@ -556,7 +557,8 @@ static int gdm_usb_probe(struct usb_interface *intf, const 
struct usb_device_id
        }
 
        /* Support for EEPROM bootloader */
-       if (bConfigurationValue = DOWNLOAD_CONF_VALUE || idProduct & 
B_DOWNLOAD) 
{
+       if (bConfigurationValue = DOWNLOAD_CONF_VALUE ||
+           idProduct & B_DOWNLOAD) {
                ret = usb_boot(usbdev, bcdDevice);
                goto out;
        }
@@ -628,7 +630,8 @@ static void gdm_usb_disconnect(struct usb_interface *intf)
        idProduct = L2H(usbdev->descriptor.idProduct);
 
        if (idProduct != EMERGENCY_PID &&
-           bConfigurationValue != DOWNLOAD_CONF_VALUE && (idProduct & 
B_DOWNLOAD) 
= 0) {
+           bConfigurationValue != DOWNLOAD_CONF_VALUE &&
+           (idProduct & B_DOWNLOAD) = 0) {
 
                udev = phy_dev->priv_dev;
                udev->usbdev = NULL;
@@ -731,7 +734,8 @@ static int k_mode_thread(void *arg)
 
                        spin_lock_irqsave(&tx->lock, flags);
 
-                       list_for_each_entry_safe(t, temp, &tx->pending_list, 
p_list) {
+                       list_for_each_entry_safe(t, temp, &tx->pending_list,
+                                                p_list) {
                                list_del(&t->p_list);
                                ret = usb_submit_urb(t->urb, GFP_ATOMIC);
 
@@ -747,8 +751,8 @@ static int k_mode_thread(void *arg)
                        spin_lock_irqsave(&k_lock, flags2);
                }
                wait_event_interruptible_lock_irq(k_wait,
-                                                 !list_empty(&k_list) || 
k_mode_stop,
-                                                 k_lock);
+                                                 !list_empty(&k_list) ||
+                                                 k_mode_stop, k_lock);
                spin_unlock_irqrestore(&k_lock, flags2);
        }
        return 0;
diff --git a/drivers/staging/gdm72xx/gdm_wimax.c 
b/drivers/staging/gdm72xx/gdm_wimax.c
index 492bc78..245fdea 100644
--- a/drivers/staging/gdm72xx/gdm_wimax.c
+++ b/drivers/staging/gdm72xx/gdm_wimax.c
@@ -347,7 +347,8 @@ int gdm_wimax_send_tx(struct sk_buff *skb, struct 
net_device *dev)
        int ret = 0;
        struct nic *nic = netdev_priv(dev);
 
-       ret = gdm_wimax_send_with_cb(nic, skb->data, skb->len, tx_complete, 
nic);
+       ret = gdm_wimax_send_with_cb(nic, skb->data, skb->len, tx_complete,
+                                    nic);
        if (ret = -ENOSPC) {
                netif_stop_queue(dev);
                ret = 0;
@@ -536,7 +537,8 @@ static void gdm_wimax_cleanup_ioctl(struct net_device 
*dev)
 static void gdm_update_fsm(struct net_device *dev, struct fsm_s *new_fsm)
 {
        struct nic *nic = netdev_priv(dev);
-       struct fsm_s *cur_fsm = (struct fsm_s *)nic-
>sdk_data[SIOC_DATA_FSM].buf;
+       struct fsm_s *cur_fsm = (struct fsm_s *)
+                                       nic->sdk_data[SIOC_DATA_FSM].buf;
 
        if (!cur_fsm)
                return;
@@ -573,15 +575,16 @@ static int gdm_wimax_ioctl(struct net_device *dev, 
struct ifreq *ifr, int cmd)
                        return -EOPNOTSUPP;
                }
                if (req->cmd = SIOCG_DATA) {
-                       ret = gdm_wimax_ioctl_get_data(&req->data,
-                                                      &nic->sdk_data[req-
>data_id]);
+                       ret = gdm_wimax_ioctl_get_data(
+                               &req->data, &nic->sdk_data[req->data_id]);
                        if (ret < 0)
                                return ret;
                } else if (req->cmd = SIOCS_DATA) {
                        if (req->data_id = SIOC_DATA_FSM) {
                                /*NOTE: gdm_update_fsm should be called
                                before gdm_wimax_ioctl_set_data is called*/
-                               gdm_update_fsm(dev, (struct fsm_s *)req-
>data.buf);
+                               gdm_update_fsm(dev,
+                                              (struct fsm_s *)req->data.buf);
                        }
                        ret = gdm_wimax_ioctl_set_data(
                                &nic->sdk_data[req->data_id], &req->data);
@@ -658,7 +661,8 @@ static int gdm_wimax_hci_get_tlv(u8 *buf, u8 *T, u16 *L, 
u8 **V)
        return next_pos;
 }
 
-static int gdm_wimax_get_prepared_info(struct net_device *dev, char *buf, int 
len)
+static int gdm_wimax_get_prepared_info(struct net_device *dev, char *buf,
+                                      int len)
 {
        u8 T, *V;
        u16 L;
@@ -782,7 +786,8 @@ static void gdm_wimax_transmit_pkt(struct net_device *dev, 
char *buf, int len)
 
        switch (cmd_evt) {
        case WIMAX_RX_SDU_AGGR:
-               gdm_wimax_transmit_aggr_pkt(dev, &buf[HCI_HEADER_SIZE], 
cmd_len);
+               gdm_wimax_transmit_aggr_pkt(dev, &buf[HCI_HEADER_SIZE],
+                                           cmd_len);
                break;
        case WIMAX_RX_SDU:
                gdm_wimax_netif_rx(dev, &buf[HCI_HEADER_SIZE], cmd_len);
diff --git a/drivers/staging/gdm72xx/netlink_k.c 
b/drivers/staging/gdm72xx/netlink_k.c
index 06f7b13..9bf00e6 100644
--- a/drivers/staging/gdm72xx/netlink_k.c
+++ b/drivers/staging/gdm72xx/netlink_k.c
@@ -55,7 +55,8 @@ static void netlink_rcv_cb(struct sk_buff *skb)
        if (skb->len >= NLMSG_HDRLEN) {
                nlh = (struct nlmsghdr *)skb->data;
 
-               if (skb->len < nlh->nlmsg_len || nlh->nlmsg_len > 
ND_MAX_MSG_LEN) {
+               if (skb->len < nlh->nlmsg_len ||
+                   nlh->nlmsg_len > ND_MAX_MSG_LEN) {
                        netdev_err(skb->dev, "Invalid length (%d,%d)\n",
                                   skb->len, nlh->nlmsg_len);
                        return;
diff --git a/drivers/staging/gdm72xx/usb_boot.c 
b/drivers/staging/gdm72xx/usb_boot.c
index 75149d7..998af04 100644
--- a/drivers/staging/gdm72xx/usb_boot.c
+++ b/drivers/staging/gdm72xx/usb_boot.c
@@ -106,7 +106,8 @@ static int gdm_wibro_recv(struct usb_device *usbdev, void 
*data, int len)
        return 0;
 }
 
-static int download_image(struct usb_device *usbdev, const struct firmware 
*firm,
+static int download_image(struct usb_device *usbdev,
+                         const struct firmware *firm,
                          loff_t pos, u32 img_len, u32 magic_num)
 {
        struct dn_header h;

