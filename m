From: Edward Cree <ecree@solarflare.com>
Date: Tue, 31 Jan 2017 16:37:10 +0000
Subject: Re: [PATCH][net-next] sfc: fix an off-by-one compare on an array size
Message-Id: <0a30579a-b0e4-11cd-8613-735c143061e1@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170131163002.20882-1-colin.king@canonical.com>
In-Reply-To: <20170131163002.20882-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 31/01/17 16:30, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> encap_type should be checked to see if it is greater or equal to
> the size of array map to fix an off-by-one array size check. This
> fixes an array overrun read as detected by static analysis by
> CoverityScan, CID#1398883 ("Out-of-bounds-read")
>
> Fixes: 9b41080125176841e ("sfc: insert catch-all filters for encapsulated traffic")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Good catch.

Acked-by: Edward Cree <ecree@solarflare.com>
> ---
>  drivers/net/ethernet/sfc/ef10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
> index 8bec938..0475f18 100644
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


The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
