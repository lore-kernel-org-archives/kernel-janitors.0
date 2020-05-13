From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 13:44:46 +0000
Subject: Re: [PATCH] rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()
Message-Id: <20200513134446.GC3041@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513093951.GD347693@mwanda>
 <ba9452bd2cff4888b76fd17ef85a274b@bfs.de>
In-Reply-To: <ba9452bd2cff4888b76fd17ef85a274b@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>, Kalle Valo <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, May 13, 2020 at 01:38:09PM +0000, Walter Harms wrote:
> IMHO _rtl_usb_transmit() should not free() either
> it should return -1.
> The only caller is rtl_usb_tx() where we need a check:
> 
> if ( _rtl_usb_transmit()  < 0)
>   goto err_free;
> 
> but i am confused, rtl_usb_tx() is returning NETDEV_TX_OK in an error case ?
> 
> err_free:
>      dev_kfree_skb_any(skb);
>       return NETDEV_TX_OK;

This is a pretty typical pattern in networking.  For convenience we are
pretending that the transmit always succeeds and that the packet was
lost somewhere in the network.  The TCP layer will ask for a resend.

regards,
dan carpenter
