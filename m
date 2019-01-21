From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 21 Jan 2019 17:56:10 +0000
Subject: Re: [PATCH -next] staging: rtl8712: drop pointless static qualifier in r8712_efuse_pg_packet_write()
Message-Id: <bfb52a90-554c-a144-b928-eb787831ccd0@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548057193-130411-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548057193-130411-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/21/19 1:53 AM, YueHaibing wrote:
> There is no need to have the 'intrepeat_times' variable static since new
> value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/staging/rtl8712/rtl8712_efuse.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
> index 8bc45ff..39eb743 100644
> --- a/drivers/staging/rtl8712/rtl8712_efuse.c
> +++ b/drivers/staging/rtl8712/rtl8712_efuse.c
> @@ -358,7 +358,7 @@ u8 r8712_efuse_pg_packet_write(struct _adapter *padapter, const u8 offset,
>   	u8 pg_header = 0;
>   	u16 efuse_addr = 0, curr_size = 0;
>   	u8 efuse_data, target_word_cnts = 0;
> -	static int repeat_times;
> +	int repeat_times;
>   	int sub_repeat;
>   	u8 bResult = true;

Clearly, the value of this variable is not intended to be carried over between 
calls to this routine. Your fix is correct.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
