From: Joshua Clayton <stillcompiling@gmail.com>
Date: Sun, 31 Jan 2016 00:37:49 +0000
Subject: Re: [patch] staging: rtl8712: memory corruption in wpa_set_encryption()
Message-Id: <2214433.RePI7YjxKq@diplodocus>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160130144110.GE3462@mwanda>
In-Reply-To: <20160130144110.GE3462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Luis de Bethencourt <luisbg@osg.samsung.com>, Punit Vara <punitvara@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>, Alison Schofield <amsfield22@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Saturday, January 30, 2016 05:41:10 PM Dan Carpenter wrote:
> ->KeyMaterial is declared as a 16 byte array, but we only ever allocate
> either 5 or 13 bytes of it.  The problem is that we memset() all 16
> bytes to zero so we're memsetting past the end of the allocated memory.
> 
> I fixed this in slightly lazy way, by just allocating 16 bytes.  This
> works but there is a lot more cleanup you could do to this code if you
> wanted.  Which is why this code is in staging.
Better in every way than a crazy variable alloc if you ask me.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> index edfc680..db2e31bc 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> @@ -398,12 +398,9 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
>  			wep_key_idx = 0;
>  		if (wep_key_len > 0) {
>  			wep_key_len = wep_key_len <= 5 ? 5 : 13;
> -			pwep = kmalloc((u32)(wep_key_len +
> -				FIELD_OFFSET(struct NDIS_802_11_WEP,
> -				KeyMaterial)), GFP_ATOMIC);
> +			pwep = kzalloc(sizeof(*pwep), GFP_ATOMIC);
>  			if (pwep = NULL)
>  				return -ENOMEM;
> -			memset(pwep, 0, sizeof(struct NDIS_802_11_WEP));

Should there be a newline after the "if" statement?
>  			pwep->KeyLength = wep_key_len;
>  			pwep->Length = wep_key_len +
>  				 FIELD_OFFSET(struct NDIS_802_11_WEP,

