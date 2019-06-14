From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 14 Jun 2019 12:11:22 +0000
Subject: Re: [PATCH net-next] hinic: Use devm_kasprintf instead of hard coding it
Message-Id: <c55cd76d-2d3e-d9b2-1f1b-4881102c407d@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613195412.1702-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190613195412.1702-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: aviad.krawczyk@huawei.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

I got a:

<aviad.krawczyk@huawei.com>: host huawei.com[103.218.216.136] said: 550
5.1.1 Error: invalid recipients is found from 80.12.242.127

However, MAINTAINERS has:
   HUAWEI ETHERNET DRIVER
   M:	Aviad Krawczyk <aviad.krawczyk@huawei.com>
   L:	netdev@vger.kernel.org
   S:	Supported
   F:	Documentation/networking/hinic.txt
   F:	drivers/net/ethernet/huawei/hinic/

I don't know how this should be fixed (neither if it should be...), so if s.o. knows, please do.

Best regards,
Christophe Jaillet

Le 13/06/2019 à 21:54, Christophe JAILLET a écrit :
> 'devm_kasprintf' is less verbose than:
>     snprintf(NULL, 0, ...);
>     devm_kzalloc(...);
>     sprintf
> so use it instead.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/net/ethernet/huawei/hinic/hinic_rx.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/huawei/hinic/hinic_rx.c b/drivers/net/ethernet/huawei/hinic/hinic_rx.c
> index 9b4082557ad5..95b09fd110d3 100644
> --- a/drivers/net/ethernet/huawei/hinic/hinic_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_rx.c
> @@ -493,7 +493,7 @@ int hinic_init_rxq(struct hinic_rxq *rxq, struct hinic_rq *rq,
>   		   struct net_device *netdev)
>   {
>   	struct hinic_qp *qp = container_of(rq, struct hinic_qp, rq);
> -	int err, pkts, irqname_len;
> +	int err, pkts;
>   
>   	rxq->netdev = netdev;
>   	rxq->rq = rq;
> @@ -502,13 +502,11 @@ int hinic_init_rxq(struct hinic_rxq *rxq, struct hinic_rq *rq,
>   
>   	rxq_stats_init(rxq);
>   
> -	irqname_len = snprintf(NULL, 0, "hinic_rxq%d", qp->q_id) + 1;
> -	rxq->irq_name = devm_kzalloc(&netdev->dev, irqname_len, GFP_KERNEL);
> +	rxq->irq_name = devm_kasprintf(&netdev->dev, GFP_KERNEL,
> +				       "hinic_rxq%d", qp->q_id);
>   	if (!rxq->irq_name)
>   		return -ENOMEM;
>   
> -	sprintf(rxq->irq_name, "hinic_rxq%d", qp->q_id);
> -
>   	pkts = rx_alloc_pkts(rxq);
>   	if (!pkts) {
>   		err = -ENOMEM;
