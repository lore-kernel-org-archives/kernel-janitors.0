From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 26 Oct 2020 10:52:08 +0000
Subject: Re: [PATCH 1/2 v2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check in probe
Message-Id: <20201026105208.GB1442058@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112347.GC282278@mwanda>
 <20201023114017.GE18329@kadam>
In-Reply-To: <20201023114017.GE18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2020 at 02:40:17PM +0300, Dan Carpenter wrote:
> The typec_register_port() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ah, sorry. You had already fixed the commit message.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: Fix a typo in the commit message.  s/return error pointers/return NULL/.
>     Thanks, Walter!
> 
>  drivers/usb/typec/stusb160x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index ce0bd7b3ad88..f7369e371dd4 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	}
>  
>  	chip->port = typec_register_port(chip->dev, &chip->capability);
> -	if (!chip->port) {
> -		ret = -ENODEV;
> +	if (IS_ERR(chip->port)) {
> +		ret = PTR_ERR(chip->port);
>  		goto all_reg_disable;
>  	}
>  
> -- 
> 2.28.0

thanks,

-- 
heikki
