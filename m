From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 13:08:06 +0000
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant assignment to rtStatus
Message-Id: <c145610a-b5c7-9bfd-eb06-e51eb324dae0@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617124726.27961-1-colin.king@canonical.com>
In-Reply-To: <20190617124726.27961-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/06/2019 13:47, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable rtStatus is initialized with a value that is never read
> and later it is reassigned a new value.  Hence the initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 21f2365fa627..bda19769c37f 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -352,7 +352,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
>  /*  */
>  s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
>  {
> -	s32 rtStatus = _SUCCESS;
> +	s32 rtStatus;
>  	u8 write_fw = 0;
>  	unsigned long fwdl_start_time;
>  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
> 

Actually, ignore this, the driver has lots more of these that need
cleaning up, I'll send a V2 with all the fixups later.

Colin
