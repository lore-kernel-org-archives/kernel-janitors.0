From: Luca Bartolacci <inductionv8@gmail.com>
Date: Mon, 11 Nov 2013 04:06:21 +0000
Subject: [patch 2/2] bluetooth:bfusb.c Clean assigment in if condition.
Message-Id: <CAAL8FfATHpfzeJor5x8yj6VbguMGrKFjFt8Xk4d2ZkVF_-66_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm not sure if the change is justified.
An other question is. Can i "clean" a complete directory (Like
/bluetooth) an put it all in one patch? That way is more easy for you?
Im asking all these questions to understand what is better to avoid
spam to the others.
Im sure the these questions are dumb. But i really want to help to this project.

index 3138699..08fba91 100644
--- a/drivers/bluetooth/bfusb.c
+++ b/drivers/bluetooth/bfusb.c
@@ -131,8 +131,10 @@ static int bfusb_send_bulk(struct bfusb_data *data, struct

        BT_DBG("bfusb %p skb %p len %d", data, skb, skb->len);

-       if (!urb && !(urb = usb_alloc_urb(0, GFP_ATOMIC)))
-               return -ENOMEM;
+       if (!urb)
+               urb = usb_alloc_urb(0, GFP_ATOMIC);
+               if (!urb)
+                       return -ENOMEM;

        pipe = usb_sndbulkpipe(data->udev, data->bulk_out_ep);


@@ -218,8 +220,10 @@ static int bfusb_rx_submit(struct bfusb_data *data, struct

        BT_DBG("bfusb %p urb %p", data, urb);

-       if (!urb && !(urb = usb_alloc_urb(0, GFP_ATOMIC)))
-               return -ENOMEM;
+       if (!urb)
+               urb = usb_alloc_urb(0, GFP_ATOMIC);
+               if (!urb)
+                       return -ENOMEM;
