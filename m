From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 29 Nov 2019 19:22:05 +0000
Subject: Re: [PATCH] Bluetooth: btusb: fix memory leak on fw
Message-Id: <F011BBCD-8D95-4934-AB3E-0F264990D4F2@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191129173635.87479-1-colin.king@canonical.com>
In-Reply-To: <20191129173635.87479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Currently the error return path when the call to btusb_mtk_hci_wmt_sync
> fails does not free fw.  Fix this by returning via the error_release_fw
> label that performs the free'ing.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btusb.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
