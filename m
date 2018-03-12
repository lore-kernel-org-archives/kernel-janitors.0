From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 12 Mar 2018 16:11:25 +0000
Subject: Re: [PATCH 4/5] Bluetooth: btmrvl: Delete an unnecessary variable initialisation in btmrvl_sdio_card
Message-Id: <4A308847-949D-4805-9508-4D016B105A64@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8d050f76-aed1-7b6b-8778-a78aef34d4ea@users.sourceforge.net>
 <2c2f8733-c5c0-cb2f-62eb-4fa360ee271e@users.sourceforge.net>
In-Reply-To: <2c2f8733-c5c0-cb2f-62eb-4fa360ee271e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-bluetooth@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

> The variable "payload" will eventually be set to an appropriate pointer
> a bit later. Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/bluetooth/btmrvl_sdio.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

