From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 15 Aug 2019 11:36:09 +0000
Subject: Re: [PATCH] Bluetooth: hci_qca: Use kfree_skb() instead of kfree()
Message-Id: <5B79868C-9C65-46AE-8BD7-D476EA389FD0@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815083416.GF27238@mwanda>
In-Reply-To: <20190815083416.GF27238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> sk_buff structs need to be freed with kfree_skb().
> 
> Fixes: 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop baudrate change vendor event")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/bluetooth/hci_qca.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
