From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 22 Oct 2015 09:33:16 +0000
Subject: Re: [patch] Bluetooth: hci_bcm: checking for ERR_PTR instead of NULL
Message-Id: <F7002528-3BCE-4A94-B9F5-7C1CF0B54745@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151022090609.GA9202@mwanda>
In-Reply-To: <20151022090609.GA9202@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

> bt_skb_alloc() returns NULL on error, it never returns an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

patch has been applied to bluetooth-next tree.

Regards

Marcel

