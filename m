From: Greg KH <greg@kroah.com>
Date: Thu, 28 Feb 2019 08:04:54 +0000
Subject: Re: [PATCH] staging: rtl8712: assign initial value to a static variable in r8712_efuse_pg_packet_wri
Message-Id: <20190228080454.GA8210@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190227033322.127177-1-maowenan@huawei.com>
In-Reply-To: <20190227033322.127177-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, straube.linux@gmail.com, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Wed, Feb 27, 2019 at 11:33:22AM +0800, Mao Wenan wrote:
> repeat_times is a static variable, but each time when it enters
> r8712_efuse_pg_packet_write(), it is set to zero,
> this value is not consistent with last calling, so next behavior
> is not our expect.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/staging/rtl8712/rtl8712_efuse.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
> index 8bc45ffd3029..3e8421255170 100644
> --- a/drivers/staging/rtl8712/rtl8712_efuse.c
> +++ b/drivers/staging/rtl8712/rtl8712_efuse.c
> @@ -358,7 +358,7 @@ u8 r8712_efuse_pg_packet_write(struct _adapter *padapter, const u8 offset,
>  	u8 pg_header = 0;
>  	u16 efuse_addr = 0, curr_size = 0;
>  	u8 efuse_data, target_word_cnts = 0;
> -	static int repeat_times;
> +	static int repeat_times = 0;
>  	int sub_repeat;
>  	u8 bResult = true;
>  
> @@ -368,7 +368,6 @@ u8 r8712_efuse_pg_packet_write(struct _adapter *padapter, const u8 offset,
>  		return false;
>  	pg_header = MAKE_EFUSE_HEADER(offset, word_en);
>  	target_word_cnts = calculate_word_cnts(word_en);
> -	repeat_times = 0;
>  	efuse_addr = 0;
>  	while (efuse_addr < efuse_available_max_size) {
>  		curr_size = r8712_efuse_get_current_size(padapter);

This patch does not apply to my tree at all.

And are you sure this is correct?

greg k-h
