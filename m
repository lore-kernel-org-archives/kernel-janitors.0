From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 17 Jul 2019 17:58:28 +0000
Subject: Re: [PATCH] net: dsa: sja1105: Fix missing unlock on error in sk_buff()
Message-Id: <CA+h21hr7whb1yk-W-81neG5kRcJR9iR70wzu93nLA_sjeT+ruQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717062956.127446-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717062956.127446-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 17 Jul 2019 at 09:24, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Add the missing unlock before return from function sk_buff()
> in the error handling case.
>
> Fixes: f3097be21bf1 ("net: dsa: sja1105: Add a state machine for RX timestamping")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  net/dsa/tag_sja1105.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/dsa/tag_sja1105.c b/net/dsa/tag_sja1105.c
> index 1d96c9d4a8e9..26363d72d25b 100644
> --- a/net/dsa/tag_sja1105.c
> +++ b/net/dsa/tag_sja1105.c
> @@ -216,6 +216,7 @@ static struct sk_buff
>                 if (!skb) {
>                         dev_err_ratelimited(dp->ds->dev,
>                                             "Failed to copy stampable skb\n");
> +                       spin_unlock(&sp->data->meta_lock);
>                         return NULL;
>                 }
>                 sja1105_transfer_meta(skb, meta);
>
>
>
