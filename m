From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 01 Oct 2019 12:04:20 +0000
Subject: Re: [PATCH v2] usb: typec: tcpm: usb: typec: tcpm: Fix a signedness bug in tcpm_fw_get_caps()
Message-Id: <20191001120420.GA26399@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926125310.GA9967@roeck-us.net>
 <20191001120117.GA23528@mwanda>
In-Reply-To: <20191001120117.GA23528@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 01, 2019 at 03:01:17PM +0300, Dan Carpenter wrote:
> The "port->typec_caps.data" and "port->typec_caps.type" variables are
> enums and in this context GCC will treat them as an unsigned int so they
> can never be less than zero.
> 
> Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks OK to me.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: preserve the error code
> 
>  drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 96562744101c..5f61d9977a15 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4409,18 +4409,20 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  	/* USB data support is optional */
>  	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
>  	if (ret = 0) {
> -		port->typec_caps.data = typec_find_port_data_role(cap_str);
> -		if (port->typec_caps.data < 0)
> -			return -EINVAL;
> +		ret = typec_find_port_data_role(cap_str);
> +		if (ret < 0)
> +			return ret;
> +		port->typec_caps.data = ret;
>  	}
>  
>  	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
>  	if (ret < 0)
>  		return ret;
>  
> -	port->typec_caps.type = typec_find_port_power_role(cap_str);
> -	if (port->typec_caps.type < 0)
> -		return -EINVAL;
> +	ret = typec_find_port_power_role(cap_str);
> +	if (ret < 0)
> +		return ret;
> +	port->typec_caps.type = ret;
>  	port->port_type = port->typec_caps.type;
>  
>  	if (port->port_type = TYPEC_PORT_SNK)
> -- 
> 2.20.1

thanks,

-- 
heikki
