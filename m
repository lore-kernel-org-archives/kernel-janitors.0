From: Walter Harms <wharms@bfs.de>
Date: Wed, 13 May 2020 13:38:09 +0000
Subject: AW: [PATCH] rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()
Message-Id: <ba9452bd2cff4888b76fd17ef85a274b@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513093951.GD347693@mwanda>
In-Reply-To: <20200513093951.GD347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ping-Ke Shih <pkshih@realtek.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

IMHO _rtl_usb_transmit() should not free() either
it should return -1.
The only caller is rtl_usb_tx() where we need a check:

if ( _rtl_usb_transmit()  < 0)
  goto err_free;

but i am confused, rtl_usb_tx() is returning NETDEV_TX_OK in an error case ?

err_free:
     dev_kfree_skb_any(skb);
      return NETDEV_TX_OK;

hope that helps,
  wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Dan Carpenter <dan.carpenter@oracle.com>
Gesendet: Mittwoch, 13. Mai 2020 11:39:51
An: Ping-Ke Shih; Jussi Kivilinna
Cc: Kalle Valo; linux-wireless@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: [PATCH] rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()

Seven years ago we tried to fix a leak but actually introduced a double
free instead.  It was an understandable mistake because the code was a
bit confusing and the free was done in the wrong place.  The "skb"
pointer is freed in both _rtl_usb_tx_urb_setup() and _rtl_usb_transmit().
The free belongs _rtl_usb_transmit() instead of _rtl_usb_tx_urb_setup()
and I've cleaned the code up a bit to hopefully make it more clear.

Fixes: 36ef0b473fbf ("rtlwifi: usb: add missing freeing of skbuff")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index 348b0072cdd69..c66c6dc003783 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -881,10 +881,8 @@ static struct urb *_rtl_usb_tx_urb_setup(struct ieee80211_hw *hw,

        WARN_ON(NULL == skb);
        _urb = usb_alloc_urb(0, GFP_ATOMIC);
-       if (!_urb) {
-               kfree_skb(skb);
+       if (!_urb)
                return NULL;
-       }
        _rtl_install_trx_info(rtlusb, skb, ep_num);
        usb_fill_bulk_urb(_urb, rtlusb->udev, usb_sndbulkpipe(rtlusb->udev,
                          ep_num), skb->data, skb->len, _rtl_tx_complete, skb);
@@ -898,7 +896,6 @@ static void _rtl_usb_transmit(struct ieee80211_hw *hw, struct sk_buff *skb,
        struct rtl_usb *rtlusb = rtl_usbdev(rtl_usbpriv(hw));
        u32 ep_num;
        struct urb *_urb = NULL;
-       struct sk_buff *_skb = NULL;

        WARN_ON(NULL == rtlusb->usb_tx_aggregate_hdl);
        if (unlikely(IS_USB_STOP(rtlusb))) {
@@ -907,8 +904,7 @@ static void _rtl_usb_transmit(struct ieee80211_hw *hw, struct sk_buff *skb,
                return;
        }
        ep_num = rtlusb->ep_map.ep_mapping[qnum];
-       _skb = skb;
-       _urb = _rtl_usb_tx_urb_setup(hw, _skb, ep_num);
+       _urb = _rtl_usb_tx_urb_setup(hw, skb, ep_num);
        if (unlikely(!_urb)) {
                pr_err("Can't allocate urb. Drop skb!\n");
                kfree_skb(skb);
--
2.26.2
