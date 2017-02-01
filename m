From: Edward Cree <ecree@solarflare.com>
Date: Wed, 01 Feb 2017 13:24:26 +0000
Subject: Re: [patch net-next] sfc: a couple off by one bugs
Message-Id: <60d163b6-0b49-172f-288c-e1712e04a84e@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170201085040.GA31514@mwanda>
In-Reply-To: <20170201085040.GA31514@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/02/17 08:50, Dan Carpenter wrote:
> These checks are off by one.  These are just sanity checks and we don't
> ever pass invalid values for "encap_type" so it's harmless.
>
> Fixes: 9b4108012517 ("sfc: insert catch-all filters for encapsulated traffic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
One of these was already fixed by Colin Ian King in
e9904990e8e70a51574e6ec6b872f3c705ec75f0 ("sfc: fix an off-by-one compare on an
array size").
For the other one:
Acked-by: Edward Cree <ecree@solarflare.com>
> diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
> index 8bec9383d754..dec0c8083ff3 100644
> --- a/drivers/net/ethernet/sfc/ef10.c
> +++ b/drivers/net/ethernet/sfc/ef10.c
> @@ -5080,7 +5080,7 @@ static int efx_ef10_filter_insert_def(struct efx_nic *efx,
>
>               /* quick bounds check (BCAST result impossible) */
>               BUILD_BUG_ON(EFX_EF10_BCAST != 0);
> -             if (encap_type > ARRAY_SIZE(map) || map[encap_type] = 0) {
> +             if (encap_type >= ARRAY_SIZE(map) || map[encap_type] = 0) {
>                       WARN_ON(1);
>                       return -EINVAL;
>               }
> @@ -5134,7 +5134,7 @@ static int efx_ef10_filter_insert_def(struct efx_nic *efx,
>
>               /* quick bounds check (BCAST result impossible) */
>               BUILD_BUG_ON(EFX_EF10_BCAST != 0);
> -             if (encap_type > ARRAY_SIZE(map) || map[encap_type] = 0) {
> +             if (encap_type >= ARRAY_SIZE(map) || map[encap_type] = 0) {
>                       WARN_ON(1);
>                       return -EINVAL;
>               }


The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
