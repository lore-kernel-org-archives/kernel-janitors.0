From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 10 Jun 2019 13:05:48 +0000
Subject: Re: [PATCH -next] packet: remove unused variable 'status' in __packet_lookup_frame_in_block
Message-Id: <CAF=yD-JOCZHt6q3ArCqY5PMW1vP5ZmNkYMKUB14TrgU-X30cSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190610115831.175710-1-maowenan@huawei.com>
In-Reply-To: <20190610115831.175710-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: David Miller <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jun 10, 2019 at 8:17 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> The variable 'status' in  __packet_lookup_frame_in_block() is never used since
> introduction in commit f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer
> implementation."), we can remove it.
> And when __packet_lookup_frame_in_block() calls prb_retire_current_block(),
> it can pass macro TP_STATUS_KERNEL instead of 0.
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  net/packet/af_packet.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index a29d66d..fb1a79c 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -1003,7 +1003,6 @@ static void prb_fill_curr_block(char *curr,
>  /* Assumes caller has the sk->rx_queue.lock */
>  static void *__packet_lookup_frame_in_block(struct packet_sock *po,
>                                             struct sk_buff *skb,
> -                                               int status,
>                                             unsigned int len
>                                             )
>  {
> @@ -1046,7 +1045,7 @@ static void *__packet_lookup_frame_in_block(struct packet_sock *po,
>         }
>
>         /* Ok, close the current block */
> -       prb_retire_current_block(pkc, po, 0);
> +       prb_retire_current_block(pkc, po, TP_STATUS_KERNEL);

I don't think that 0 is intended to mean TP_STATUS_KERNEL here.

prb_retire_current_block calls prb_close_block which sets status to

  TP_STATUS_USER | stat

where stat is 0 or TP_STATUS_BLK_TMO.
