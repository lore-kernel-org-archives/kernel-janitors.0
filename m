From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 13 Aug 2018 14:00:42 +0000
Subject: Re: [PATCH] Bluetooth: mediatek: pass correct size to h4_recv_buf()
Message-Id: <059C8611-913E-4667-9918-510AE1E47705@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180813093235.hksi2c2ev37j4gji@kili.mountain>
In-Reply-To: <20180813093235.hksi2c2ev37j4gji@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Johan Hedberg <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

Hi Dan,

> We're supposed to pass the number of elements in the mtk_recv_pkts, not
> the number of bytes.
> 
> Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

patch has been applied to bluetooth-next tree.

Regards

Marcel
