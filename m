From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 27 Apr 2018 12:14:33 +0000
Subject: Re: [PATCH] rsi: Uninitialized return value in rsi_reset_card()
Message-Id: <87604calsm.fsf@purkki.adurom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180426144235.GA25897@mwanda>
In-Reply-To: <20180426144235.GA25897@mwanda> (Dan Carpenter's message of "Thu,
        26 Apr 2018 17:42:35 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, Karun Eagalapati <karun256@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> If rsi_usb_master_reg_write() fails then "ret" hasn't been initialized.
>
> Fixes: 16d3bb7b2f37 ("rsi: disable fw watchdog timer during reset")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/rsi/rsi_91x_usb.c b/drivers/net/wireless/rsi/rsi_91x_usb.c
> index b065438f51b2..6ce6b754df12 100644
> --- a/drivers/net/wireless/rsi/rsi_91x_usb.c
> +++ b/drivers/net/wireless/rsi/rsi_91x_usb.c
> @@ -687,9 +687,10 @@ static int rsi_reset_card(struct rsi_hw *adapter)
>  	 */
>  	msleep(100);
>  
> -	if (rsi_usb_master_reg_write(adapter, SWBL_REGOUT,
> -				     RSI_FW_WDT_DISABLE_REQ,
> -				     RSI_COMMON_REG_SIZE) < 0) {
> +	ret = rsi_usb_master_reg_write(adapter, SWBL_REGOUT,
> +				       RSI_FW_WDT_DISABLE_REQ,
> +				       RSI_COMMON_REG_SIZE);
> +	if (ret < 0) {

Odd, I thought I replied to this one already but I don't see my mail on
patchwork. Anyway, Gustavo already submitted an identical patch:

https://patchwork.kernel.org/patch/10365985/

-- 
Kalle Valo
