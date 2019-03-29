From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Mar 2019 08:24:18 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix incorrect mask for EEPROMTxPowerLevelCCK setting
Message-Id: <20190329082417.GY32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190329000244.16528-1-colin.king@canonical.com>
In-Reply-To: <20190329000244.16528-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 29, 2019 at 12:02:44AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the lower 8 bits of ret are being masked and left
> shifted by 8 bits always leaving a result of zero. The mask
> appears to be incorrect and should probably be 0xff00 instead
> of 0xff.  Fix this.  (Note: not tested).
> 
> Fixes: 16feab644fd1 ("staging: rtl8192u: check return value eprom_read")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index f1eaab337dca..a173884d31c8 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -2454,7 +2454,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
>  				ret = eprom_read(dev, (EEPROM_TX_PW_INDEX_CCK >> 1));
>  				if (ret < 0)
>  					return ret;
> -				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff) >> 8;
> +				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff00) >> 8;

I'd say there is a 80-90% chance your fix is correct...

This only affects an older rev of the eeprom I think.  I believe what
happens in the current code is that we set EEPROMTxPowerLevelCCK to
zero.  Then we subtract:

	priv->TxPowerLevelCCK[i] = priv->EEPROMTxPowerLevelOFDM24G[0] + (priv->EEPROMTxPowerLevelCCK - priv->EEPROMTxPowerLevelOFDM24G[1]);

Possibly leading to a high u8 value, then in phy_set_rf8256_cck_tx_power()
it gets capped at 0x24...

regards,
dan carpenter
