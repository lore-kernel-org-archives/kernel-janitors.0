From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Wed, 11 Nov 2020 14:14:29 +0000
Subject: Re: [PATCH][v2] Bluetooth: hci_qca: resolve various warnings
Message-Id: <20201111141429.GA3821@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201111045538.GA90261@fedora-project>
 <187b1016-06cf-9f6c-eeac-4bac8c970d58@wanadoo.fr>
In-Reply-To: <187b1016-06cf-9f6c-eeac-4bac8c970d58@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, marcel@holtmann.org
Cc: johan.hedberg@gmail.com, kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org

On Wed, Nov 11, 2020 at 11:47:48AM +0100, Christophe JAILLET wrote:
> Le 11/11/2020 à 05:55, Nigel Christian a écrit :
> > Replace symbolic permissions with octal values. Use usleep_range
> > for small msec values due to the fact that msleep() less than
> > 20ms may have unexpected behavior/sleep longer.
> > 
> > - https://lkml.org/lkml/2016/8/2/1945
> > - Documentation/timers/timers-howto.rst
> > 
> > Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> > ---
> >   drivers/bluetooth/hci_qca.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 2d3f1f179a1e..039fb117bd8f 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -631,7 +631,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
> >   	ibs_dir = debugfs_create_dir("ibs", hdev->debugfs);
> >   	/* read only */
> > -	mode = S_IRUGO;
> > +	mode = 0444;
> >   	debugfs_create_u8("tx_ibs_state", mode, ibs_dir, &qca->tx_ibs_state);
> >   	debugfs_create_u8("rx_ibs_state", mode, ibs_dir, &qca->rx_ibs_state);
> >   	debugfs_create_u64("ibs_sent_sleeps", mode, ibs_dir,
> > @@ -658,7 +658,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
> >   	debugfs_create_u32("vote_off_ms", mode, ibs_dir, &qca->vote_off_ms);
> >   	/* read/write */
> > -	mode = S_IRUGO | S_IWUSR;
> > +	mode = 0644;
> >   	debugfs_create_u32("wake_retrans", mode, ibs_dir, &qca->wake_retrans);
> >   	debugfs_create_u32("tx_idle_delay", mode, ibs_dir,
> >   			   &qca->tx_idle_delay);
> > @@ -1302,7 +1302,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
> >   	/* Give the controller time to process the request */
> >   	if (qca_is_wcn399x(qca_soc_type(hu)))
> > -		msleep(10);
> > +		usleep_range(1000, 10000);
> This...
> >   	else
> >   		msleep(300);
> > @@ -1350,7 +1350,7 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
> >   	if (on)
> >   		msleep(100);
> >   	else
> > -		msleep(10);
> > +		usleep_range(1000, 10000);
> and this change change a delay which is expected to be 10 ms, and will
> likely be ~20 ms, into a delay which can be down to 1 ms.
> Is it intended or tested?
> 
> I've not looked at the datasheet, but it looks spurious.
> 
> Just my 2c.
> 
> CJ
> 
> >   	return 0;
> >   }
> > 
> 

I see, so usleep_range(10000, 11000) so that the 10ms minimum is maintained
closer to the intended delay? Testing with info below:

Pixel 3a bluetooth tether
TOZO-T10-R bluetooth earbuds

Fedora 33
Kernel version = 5.10.0-rc3-next-20201110
System         = ASUSTeK COMPUTER INC. 1.0        UX330UAK
BIOS           = UX330UAK.302
Boot mode      = UEFI
CPU model      = Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz

dmesg -t -k > 

Bluetooth: Core ver 2.22
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
Bluetooth: hci0: Firmware revision 0.0 build 10 week 41 2018
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
