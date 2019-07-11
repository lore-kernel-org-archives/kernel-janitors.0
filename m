From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 11 Jul 2019 07:07:48 +0000
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Use kfree_skb() instead of kfree()
Message-Id: <158FFFC4-162D-4E8B-AE67-8BF338295687@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190709013530.11865-1-weiyongjun1@huawei.com>
In-Reply-To: <20190709013530.11865-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

> Use kfree_skb() instead of kfree() to free sk_buff.
> 
> Fixes: 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop baudrate change vendor event")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> drivers/bluetooth/hci_qca.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
