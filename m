From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Tue, 10 Nov 2020 13:25:28 +0000
Subject: Re: [PATCH] Bluetooth: hci_qca: resolve various warnings
Message-Id: <20201110132528.GA5112@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201101025215.GA4828@fedora-project>
 <BB6BEAED-CFED-4092-AB9A-A98A064676EE@holtmann.org>
In-Reply-To: <BB6BEAED-CFED-4092-AB9A-A98A064676EE@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>
Cc: johan.hedberg@gmail.com, kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org

On Mon, Nov 09, 2020 at 01:45:34PM +0100, Marcel Holtmann wrote:
> Hi Nigel,
> 
> > Use template string as opposed to function name. Add a blank
> > line after declaration to improve readability. Replace symbolic
> > permissions with octal values. Use usleep_range for small msec
> > values due to the fact that msleep() less than 20ms may have
> > unexpected behavior/sleep longer. This patch removes all
> > checkpatch warnings.
> > 
> > - https://lkml.org/lkml/2016/8/2/1945
> > - Documentation/timers/timers-howto.rst
> > 
> > Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> > ---
> > drivers/bluetooth/hci_qca.c | 11 ++++++-----
> > 1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 2d3f1f179a1e..22da59d8f471 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -555,7 +555,7 @@ static int qca_open(struct hci_uart *hu)
> > 	struct qca_serdev *qcadev;
> > 	struct qca_data *qca;
> > 
> > -	BT_DBG("hu %p qca_open", hu);
> > +	BT_DBG("hu %p %s", hu, __func__);
> 
> please clean up your patch before submitting it. This change does not belong
> here.
> 
> > 	if (!hci_uart_has_flow_control(hu))
> > 		return -EOPNOTSUPP;
> > @@ -631,7 +631,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
> > 	ibs_dir = debugfs_create_dir("ibs", hdev->debugfs);
> > 
> > 	/* read only */
> > -	mode = S_IRUGO;
> > +	mode = 0444;
> > 	debugfs_create_u8("tx_ibs_state", mode, ibs_dir, &qca->tx_ibs_state);
> > 	debugfs_create_u8("rx_ibs_state", mode, ibs_dir, &qca->rx_ibs_state);
> > 	debugfs_create_u64("ibs_sent_sleeps", mode, ibs_dir,
> > @@ -658,7 +658,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
> > 	debugfs_create_u32("vote_off_ms", mode, ibs_dir, &qca->vote_off_ms);
> > 
> > 	/* read/write */
> > -	mode = S_IRUGO | S_IWUSR;
> > +	mode = 0644;
> > 	debugfs_create_u32("wake_retrans", mode, ibs_dir, &qca->wake_retrans);
> > 	debugfs_create_u32("tx_idle_delay", mode, ibs_dir,
> > 			   &qca->tx_idle_delay);
> > @@ -1215,6 +1215,7 @@ static int qca_recv(struct hci_uart *hu, const void *data, int count)
> > 				  qca_recv_pkts, ARRAY_SIZE(qca_recv_pkts));
> > 	if (IS_ERR(qca->rx_skb)) {
> > 		int err = PTR_ERR(qca->rx_skb);
> > +
> 
> This omitted empty line was intentional btw.
> 
> > 		bt_dev_err(hu->hdev, "Frame reassembly failed (%d)", err);
> > 		qca->rx_skb = NULL;
> > 		return err;
> > @@ -1302,7 +1303,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
> > 
> > 	/* Give the controller time to process the request */
> > 	if (qca_is_wcn399x(qca_soc_type(hu)))
> > -		msleep(10);
> > +		usleep_range(1000, 10000);
> > 	else
> > 		msleep(300);
> > 
> > @@ -1350,7 +1351,7 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
> > 	if (on)
> > 		msleep(100);
> > 	else
> > -		msleep(10);
> > +		usleep_range(1000, 10000);
> 
> Regards
> 
> Marcel
> 

Sure, will clean up and resend. Thanks for checking on this!
