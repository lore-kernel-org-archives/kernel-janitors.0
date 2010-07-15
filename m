From: "Rose, Gregory V" <gregory.v.rose@intel.com>
Date: Thu, 15 Jul 2010 18:52:54 +0000
Subject: RE: [PATCH 5/8] drivers: ixgbevf: fix unsigned underflow
Message-Id: <43F901BD926A4E43B106BF17856F0755EA96143E@orsmsx508.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219557-12525-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279219557-12525-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, Eric Dumazet <eric.dumazet@gmail.com>, Joe Perches <joe@perches.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

>-----Original Message-----
>From: Kulikov Vasiliy [mailto:segooon@gmail.com]
>Sent: Thursday, July 15, 2010 11:46 AM
>To: kernel-janitors@vger.kernel.org
>Cc: David S. Miller; Kirsher, Jeffrey T; Rose, Gregory V; Eric Dumazet;
>Joe Perches; netdev@vger.kernel.org
>Subject: [PATCH 5/8] drivers: ixgbevf: fix unsigned underflow
>
>'count' is unsigned. It is initialized to zero, then it can be increased
>multiple times, and finally it is used in such a way:
>
>   >>>> count--;
>   |
>   |    /* clear timestamp and dma mappings for remaining portion of
>packet */
>   |    while (count >= 0) {
>   |            count--;
>   |            ...
>   ^
>If count is zero here (so, it was never increased), we would have a very
>long loop :)
>
>Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>---
> drivers/net/ixgbevf/ixgbevf_main.c |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
>diff --git a/drivers/net/ixgbevf/ixgbevf_main.c
>b/drivers/net/ixgbevf/ixgbevf_main.c
>index 73f1e75..af49135 100644
>--- a/drivers/net/ixgbevf/ixgbevf_main.c
>+++ b/drivers/net/ixgbevf/ixgbevf_main.c
>@@ -2935,7 +2935,8 @@ static int ixgbevf_tx_map(struct ixgbevf_adapter
>*adapter,
> 	struct ixgbevf_tx_buffer *tx_buffer_info;
> 	unsigned int len;
> 	unsigned int total = skb->len;
>-	unsigned int offset = 0, size, count = 0;
>+	unsigned int offset = 0, size;
>+	int count = 0;
> 	unsigned int nr_frags = skb_shinfo(skb)->nr_frags;
> 	unsigned int f;
> 	int i;
>--
>1.7.0.4

Acked By: Greg Rose <gregory.v.rose@intel.com>

