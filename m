From: =?iso-8859-1?Q?St=E9phane_Grosjean?= <s.grosjean@peak-system.com>
Date: Wed, 14 Oct 2020 13:22:11 +0000
Subject: RE: [PATCH net] can: peak_usb: add range checking in decode operations
Message-Id: <VI1PR03MB50536300783DBBEAFC7B0367D6050@VI1PR03MB5053.eurprd03.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813140604.GA456946@mwanda>
In-Reply-To: <20200813140604.GA456946@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Andri Yngvason <andri.yngvason@marel.com>, Oliver Hartkopp <socketcan@hartkopp.net>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfgang Grandegger <wg@grandegger.com>

Hello Dan,

Don't know if this patch is still relevant, but:

- there is absolutely no reason for the device firmware to provide a channe=
l index greater than or equal to 2, because the IP core of these USB device=
s handles 2 channels only. Anyway, these changes are correct.
- considering the verification of the length "cfd->len" on the other hand, =
this one comes directly from can_send() via dev_queue_xmit() AFAIK and it s=
eems to me that the underlying driver can assume that its value is smaller =
than 64.

Regards,
---
St=E9phane Grosjean
PEAK-System France
132, rue Andr=E9 Bisiaux
F-54320 MAXEVILLE
T=E9l : +(33) 9.72.54.51.97



De : Dan Carpenter <dan.carpenter@oracle.com>
Envoy=E9 : jeudi 13 ao=FBt 2020 16:06
=C0 : Wolfgang Grandegger <wg@grandegger.com>; St=E9phane Grosjean <s.grosj=
ean@peak-system.com>
Cc : Marc Kleine-Budde <mkl@pengutronix.de>; David S. Miller <davem@davemlo=
ft.net>; Jakub Kicinski <kuba@kernel.org>; Andri Yngvason <andri.yngvason@m=
arel.com>; Oliver Hartkopp <socketcan@hartkopp.net>; linux-can@vger.kernel.=
org <linux-can@vger.kernel.org>; netdev@vger.kernel.org <netdev@vger.kernel=
.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>
Objet : [PATCH net] can: peak_usb: add range checking in decode operations

These values come from skb->data so Smatch considers them untrusted.  I
believe Smatch is correct but I don't have a way to test this.

The usb_if->dev[] array has 2 elements but the index is in the 0-15
range without checks.  The cfd->len can be up to 255 but the maximum
valid size is CANFD_MAX_DLEN (64) so that could lead to memory
corruption.

Fixes: 0a25e1f4f185 ("can: peak_usb: add support for PEAK new CANFD USB ada=
pters")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/can/usb/peak_usb/pcan_usb_fd.c | 48 +++++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c b/drivers/net/can/u=
sb/peak_usb/pcan_usb_fd.c
index 47cc1ff5b88e..dee3e689b54d 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
@@ -468,12 +468,18 @@ static int pcan_usb_fd_decode_canmsg(struct pcan_usb_=
fd_if *usb_if,
                                      struct pucan_msg *rx_msg)
 {
         struct pucan_rx_msg *rm =3D (struct pucan_rx_msg *)rx_msg;
-       struct peak_usb_device *dev =3D usb_if->dev[pucan_msg_get_channel(r=
m)];
-       struct net_device *netdev =3D dev->netdev;
+       struct peak_usb_device *dev;
+       struct net_device *netdev;
         struct canfd_frame *cfd;
         struct sk_buff *skb;
         const u16 rx_msg_flags =3D le16_to_cpu(rm->flags);

+       if (pucan_msg_get_channel(rm) >=3D ARRAY_SIZE(usb_if->dev))
+               return -ENOMEM;
+
+       dev =3D usb_if->dev[pucan_msg_get_channel(rm)];
+       netdev =3D dev->netdev;
+
         if (rx_msg_flags & PUCAN_MSG_EXT_DATA_LEN) {
                 /* CANFD frame case */
                 skb =3D alloc_canfd_skb(netdev, &cfd);
@@ -519,15 +525,21 @@ static int pcan_usb_fd_decode_status(struct pcan_usb_=
fd_if *usb_if,
                                      struct pucan_msg *rx_msg)
 {
         struct pucan_status_msg *sm =3D (struct pucan_status_msg *)rx_msg;
-       struct peak_usb_device *dev =3D usb_if->dev[pucan_stmsg_get_channel=
(sm)];
-       struct pcan_usb_fd_device *pdev =3D
-                       container_of(dev, struct pcan_usb_fd_device, dev);
+       struct pcan_usb_fd_device *pdev;
         enum can_state new_state =3D CAN_STATE_ERROR_ACTIVE;
         enum can_state rx_state, tx_state;
-       struct net_device *netdev =3D dev->netdev;
+       struct peak_usb_device *dev;
+       struct net_device *netdev;
         struct can_frame *cf;
         struct sk_buff *skb;

+       if (pucan_stmsg_get_channel(sm) >=3D ARRAY_SIZE(usb_if->dev))
+               return -ENOMEM;
+
+       dev =3D usb_if->dev[pucan_stmsg_get_channel(sm)];
+       pdev =3D container_of(dev, struct pcan_usb_fd_device, dev);
+       netdev =3D dev->netdev;
+
         /* nothing should be sent while in BUS_OFF state */
         if (dev->can.state =3D=3D CAN_STATE_BUS_OFF)
                 return 0;
@@ -579,9 +591,14 @@ static int pcan_usb_fd_decode_error(struct pcan_usb_fd=
_if *usb_if,
                                     struct pucan_msg *rx_msg)
 {
         struct pucan_error_msg *er =3D (struct pucan_error_msg *)rx_msg;
-       struct peak_usb_device *dev =3D usb_if->dev[pucan_ermsg_get_channel=
(er)];
-       struct pcan_usb_fd_device *pdev =3D
-                       container_of(dev, struct pcan_usb_fd_device, dev);
+       struct pcan_usb_fd_device *pdev;
+       struct peak_usb_device *dev;
+
+       if (pucan_ermsg_get_channel(er) >=3D ARRAY_SIZE(usb_if->dev))
+               return -EINVAL;
+
+       dev =3D usb_if->dev[pucan_ermsg_get_channel(er)];
+       pdev =3D container_of(dev, struct pcan_usb_fd_device, dev);

         /* keep a trace of tx and rx error counters for later use */
         pdev->bec.txerr =3D er->tx_err_cnt;
@@ -595,11 +612,17 @@ static int pcan_usb_fd_decode_overrun(struct pcan_usb=
_fd_if *usb_if,
                                       struct pucan_msg *rx_msg)
 {
         struct pcan_ufd_ovr_msg *ov =3D (struct pcan_ufd_ovr_msg *)rx_msg;
-       struct peak_usb_device *dev =3D usb_if->dev[pufd_omsg_get_channel(o=
v)];
-       struct net_device *netdev =3D dev->netdev;
+       struct peak_usb_device *dev;
+       struct net_device *netdev;
         struct can_frame *cf;
         struct sk_buff *skb;

+       if (pufd_omsg_get_channel(ov) >=3D ARRAY_SIZE(usb_if->dev))
+               return -EINVAL;
+
+       dev =3D usb_if->dev[pufd_omsg_get_channel(ov)];
+       netdev =3D dev->netdev;
+
         /* allocate an skb to store the error frame */
         skb =3D alloc_can_err_skb(netdev, &cf);
         if (!skb)
@@ -716,6 +739,9 @@ static int pcan_usb_fd_encode_msg(struct peak_usb_devic=
e *dev,
         u16 tx_msg_size, tx_msg_flags;
         u8 can_dlc;

+       if (cfd->len > CANFD_MAX_DLEN)
+               return -EINVAL;
+
         tx_msg_size =3D ALIGN(sizeof(struct pucan_tx_msg) + cfd->len, 4);
         tx_msg->size =3D cpu_to_le16(tx_msg_size);
         tx_msg->type =3D cpu_to_le16(PUCAN_MSG_CAN_TX);
--
2.28.0

--
PEAK-System Technik GmbH
Sitz der Gesellschaft Darmstadt - HRB 9183
Geschaeftsfuehrung: Alexander Gach / Uwe Wilhelm
Unsere Datenschutzerklaerung mit wichtigen Hinweisen
zur Behandlung personenbezogener Daten finden Sie unter
www.peak-system.com/Datenschutz.483.0.html
