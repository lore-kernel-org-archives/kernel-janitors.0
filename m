From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 28 Mar 2017 13:36:31 +0000
Subject: Re: [PATCH] 6lowpan: fix assignment of peer_addr
Message-Id: <CCFA5E70-E7CA-40C0-B051-FE7FFE74D16E@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170328121129.18421-1-colin.king@canonical.com>
In-Reply-To: <20170328121129.18421-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> The data from peer->chan->dst is not being copied to peer_addr, the
> current code just updates the pointer and not the contents of what
> it points to.  Fix this with the intended assignment.
> 
> Detected by CoverityScan, CID#1422111 ("Parse warning
> (PW.PARAM_SET_BUT_NOT_USED)")
> 
> Fixes: fb6f2f606ce8 ("6lowpan: Fix IID format for Bluetooth")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/bluetooth/6lowpan.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

