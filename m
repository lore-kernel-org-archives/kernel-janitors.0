From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 22 Aug 2019 15:35:39 +0000
Subject: Re: [PATCH] typec: tcpm: fix a typo in the comparison of pdo_max_voltage
Message-Id: <20190822153539.GD5356@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822135212.10195-1-colin.king@canonical.com>
In-Reply-To: <20190822135212.10195-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 22, 2019 at 02:52:12PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There appears to be a typo in the comparison of pdo_max_voltage[i]
> with the previous value, currently it is checking against the
> array pdo_min_voltage rather than pdo_max_voltage. I believe this
> is a typo. Fix this.
> 
> Addresses-Coverity: ("Copy-paste error")
> Fixes: 5007e1b5db73 ("typec: tcpm: Validate source and sink caps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 166b28562395..96562744101c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1439,7 +1439,7 @@ static enum pdo_err tcpm_caps_err(struct tcpm_port *port, const u32 *pdo,
>  				else if ((pdo_min_voltage(pdo[i]) =
>  					  pdo_min_voltage(pdo[i - 1])) &&
>  					 (pdo_max_voltage(pdo[i]) =
> -					  pdo_min_voltage(pdo[i - 1])))
> +					  pdo_max_voltage(pdo[i - 1])))
>  					return PDO_ERR_DUPE_PDO;
>  				break;
>  			/*
> -- 
> 2.20.1

thanks,

-- 
heikki
