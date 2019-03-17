From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 17 Mar 2019 11:26:47 +0000
Subject: Re: [PATCH net] staging: rtl8188eu: use is_zero_ether_addr() instead of memcmp()
Message-Id: <20190317112647.GG4614@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190309032600.98732-1-maowenan@huawei.com>
In-Reply-To: <20190309032600.98732-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com, jananis37@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, davem@davemloft.net

On Sat, Mar 09, 2019 at 11:26:00AM +0800, Mao Wenan wrote:
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

As Joe said, you have to prove that this is properly aligned before you
can call this function.  Please do so.

thanks,

greg k-h
