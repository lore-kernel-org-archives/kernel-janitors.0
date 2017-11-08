From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 08 Nov 2017 07:34:28 +0000
Subject: Re: [PATCH] Bluetooth: Use common error handling code in bt_init()
Message-Id: <7A6D341D-2ABC-417C-8808-A907E61F08E6@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cc83ce48-c0a4-1b83-8fdc-a474eb102fe0@users.sourceforge.net>
In-Reply-To: <cc83ce48-c0a4-1b83-8fdc-a474eb102fe0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

> * Improve jump targets so that a bit of exception handling can be better
>  reused at the end of this function.
> 
> * Adjust five condition checks.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> net/bluetooth/af_bluetooth.c | 38 +++++++++++++++++---------------------
> 1 file changed, 17 insertions(+), 21 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

