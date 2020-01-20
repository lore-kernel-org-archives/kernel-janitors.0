From: Corey Minyard <cminyard@mvista.com>
Date: Mon, 20 Jan 2020 17:01:32 +0000
Subject: Re: [PATCH][next] drivers: ipmi: fix off-by-one bounds check that leads to a out-of-bounds write
Message-Id: <20200120170132.GT2886@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114144031.358003-1-colin.king@canonical.com>
 <DB6PR0501MB2712BEBCF959566EAB063769DA340@DB6PR0501MB2712.eurprd05.prod.outlook.com>
In-Reply-To: <DB6PR0501MB2712BEBCF959566EAB063769DA340@DB6PR0501MB2712.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vadim Pasternak <vadimp@mellanox.com>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 14, 2020 at 03:50:22PM +0000, Asmaa Mnebhi wrote:
> Reviewed-by: Asmaa Mnebhi <asmaa@mellanox.com>

Thanks, I've picked this up in my next tree.

-corey

> 
> -----Original Message-----
> From: Colin King <colin.king@canonical.com> 
> Sent: Tuesday, January 14, 2020 9:41 AM
> To: Corey Minyard <cminyard@mvista.com>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Vadim Pasternak <vadimp@mellanox.com>; Asmaa Mnebhi <Asmaa@mellanox.com>; openipmi-developer@lists.sourceforge.net
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drivers: ipmi: fix off-by-one bounds check that leads to a out-of-bounds write
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The end of buffer check is off-by-one since the check is against an index that is pre-incremented before a store to buf[]. Fix this adjusting the bounds check appropriately.
> 
> Addresses-Coverity: ("Out-of-bounds write")
> Fixes: 51bd6f291583 ("Add support for IPMB driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 9fdae83e59e0..382b28f1cf2f 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -279,7 +279,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
>  		break;
>  
>  	case I2C_SLAVE_WRITE_RECEIVED:
> -		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg))
> +		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg) - 1)
>  			break;
>  
>  		buf[++ipmb_dev->msg_idx] = *val;
> --
> 2.24.0
> 
