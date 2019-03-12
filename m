From: maowenan <maowenan@huawei.com>
Date: Tue, 12 Mar 2019 06:29:29 +0000
Subject: Re: [PATCH net] staging: rtl8188eu: use is_zero_ether_addr() instead of memcmp()
Message-Id: <951c83d2-fa0d-11ed-96a9-cee620c9c096@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190309032600.98732-1-maowenan@huawei.com>
In-Reply-To: <20190309032600.98732-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, straube.linux@gmail.com, jananis37@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, davem@davemloft.net

ping...

On 2019/3/9 11:26, Mao Wenan wrote:
> Using is_zero_ether_addr() instead of directly use
> memcmp() to determine if the ethernet address is all
> zeros.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index 714f7a70ed64..beae367df93b 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -180,9 +180,8 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>  {
>  	struct list_head *phead, *plist;
>  	struct wlan_network *pnetwork = NULL;
> -	u8 zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
>  
> -	if (!memcmp(zero_addr, addr, ETH_ALEN)) {
> +	if (is_zero_ether_addr(addr)) {
>  		pnetwork = NULL;
>  		goto exit;
>  	}
> 
