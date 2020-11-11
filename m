From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 11 Nov 2020 10:54:45 +0000
Subject: Re: [PATCH][next] Bluetooth: btrtl: fix incorrect skb allocation failure check
Message-Id: <0DA7A8C1-07AA-4342-A16A-FEB5C5825C76@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201110123915.3356601-1-colin.king@canonical.com>
In-Reply-To: <20201110123915.3356601-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Currently the check for a failed bt_skb_alloc allocation is incorrectly
> checking using IS_ERR and this can lead to a null pointer dereference. Fix
> this by checking for a null pointer return using the !skb idiom.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 1996d9cad6ad ("Bluetooth: btrtl: Ask 8821C to drop old firmware")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btrtl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
