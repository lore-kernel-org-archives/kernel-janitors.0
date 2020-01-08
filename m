From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 08 Jan 2020 20:45:05 +0000
Subject: Re: [PATCH] Bluetooth: remove redundant assignment to variable icid
Message-Id: <3C4BC7D9-4024-43C5-B68D-006EFB764FAE@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107180013.124501-1-colin.king@canonical.com>
In-Reply-To: <20200107180013.124501-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, BlueZ devel list <linux-bluetooth@vger.kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Variable icid is being rc is assigned with a value that is never
> read. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/bluetooth/l2cap_core.c | 1 -
> 1 file changed, 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
