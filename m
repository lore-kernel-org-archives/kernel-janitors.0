From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 23:23:22 +0000
Subject: Re: [PATCH] net: usb: Delete unnecessary checks before the macro call =?iso-2022-jp?B?GyRCIUgbKEJkZX
Message-Id: <20190822.162322.666892826002905972.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425214be-355b-92c0-bc74-1d0ea899290f@web.de>
In-Reply-To: <425214be-355b-92c0-bc74-1d0ea899290f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus.Elfring@web.de
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, petkan@nucleusys.com, swinslow@gmail.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 22:24:16 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 22:16:02 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
