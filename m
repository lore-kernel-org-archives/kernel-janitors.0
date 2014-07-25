From: Christophe RICARD <christophe.ricard@gmail.com>
Date: Fri, 25 Jul 2014 09:13:14 +0000
Subject: Re: [PATCH] NFC: st21nfca: Remove double assignment of .owner in struct device_driver
Message-Id: <20140725111314.0578f122@toffy-MacBookPro>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401718860-10901-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401718860-10901-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon,  2 Jun 2014 16:21:00 +0200
Emil Goode <emilgoode@gmail.com> wrote:

> The .owner member of struct device_driver is assigned THIS_MODULE
> twice.
> 
> Introduced by:
> 
> commit c44cb2edd01ca31471d9385f0895891b006ab904
> ("NFC: dts: st21nfca: Add device-tree (Open Firmware) support to
> st21nfca")
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  drivers/nfc/st21nfca/i2c.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
> index 3f954ed..95942ca 100644
> --- a/drivers/nfc/st21nfca/i2c.c
> +++ b/drivers/nfc/st21nfca/i2c.c
> @@ -710,7 +710,6 @@ static struct i2c_driver st21nfca_hci_i2c_driver
> = { .driver = {
>  		.owner = THIS_MODULE,
>  		.name = ST21NFCA_HCI_I2C_DRIVER_NAME,
> -		.owner = THIS_MODULE,
>  		.of_match_table > of_match_ptr(of_st21nfca_i2c_match), },
>  	.probe = st21nfca_hci_i2c_probe,

Acked-by: Christophe RICARD <christophe-h.ricard@st.com>
