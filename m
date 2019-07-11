From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 11 Jul 2019 07:05:25 +0000
Subject: Re: [PATCH -next] Bluetooth: btusb: Fix error return code in btusb_mtk_setup_firmware()
Message-Id: <44F125E4-F492-4F33-9E50-F10CE11C09BC@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190710061222.141247-1-weiyongjun1@huawei.com>
In-Reply-To: <20190710061222.141247-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, kernel-janitors@vger.kernel.org, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Wei,

> Fix to return error code -EINVAL from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> drivers/bluetooth/btusb.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
