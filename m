From: Amelie DELAUNAY <amelie.delaunay@st.com>
Date: Wed, 28 Oct 2020 12:26:16 +0000
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-Id: <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112412.GD282278@mwanda>
In-Reply-To: <20201023112412.GD282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 10/23/20 1:24 PM, Dan Carpenter wrote:
> These variables are enums but in this situation GCC will treat them as
> unsigned so the conditions are never true.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/typec/stusb160x.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index f7369e371dd4..da7f1957bcb3 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -545,7 +545,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>   	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
>   	if (!ret) {
>   		chip->port_type = typec_find_port_power_role(cap_str);
> -		if (chip->port_type < 0) {
> +		if ((int)chip->port_type < 0) {
>   			ret = chip->port_type;
>   			return ret;
>   		}

I was preparing a patch for this one, and it uses the ret instead of the 
cast:
	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
	if (!ret) {
		ret = typec_find_port_power_role(cap_str);
		if (ret < 0)
			return ret;
		chip->port_type = ret;

	}

> @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>   	if (!ret) {
>   		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
>   		/* Power delivery not yet supported */
> -		if (chip->pwr_opmode < 0 ||
> +		if ((int)chip->pwr_opmode < 0 ||
>   		    chip->pwr_opmode = TYPEC_PWR_MODE_PD) {
> -			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
> +			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
> +							  -EINVAL;
>   			dev_err(chip->dev, "bad power operation mode: %d\n",
>   				chip->pwr_opmode);
>   			return ret;
> 

	if (!ret) {
		ret = typec_find_pwr_opmode(cap_str);
		/* Power delivery not yet supported */
		if (ret < 0 || ret = TYPEC_PWR_MODE_PD) {
			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
			return -EINVAL;
		}
		chip->pwr_opmode = ret;
	}


So, which fix sounds better ? IMHO using ret make the code more readable.

Regards,
Amelie
