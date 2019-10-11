From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Fri, 11 Oct 2019 13:59:35 +0000
Subject: Re: [PATCH] usb: typec: fix an IS_ERR() vs NULL bug in hd3ss3220_probe()
Message-Id: <20191011135935.GB32191@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011133558.GC22905@mwanda>
In-Reply-To: <20191011133558.GC22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 11, 2019 at 04:35:58PM +0300, Dan Carpenter wrote:
> The device_get_named_child_node() function doesn't return error
> pointers, it returns NULL on error.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 9715600aeb04..37b08f57aac4 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	hd3ss3220_set_source_pref(hd3ss3220,
>  				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
>  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
> -	if (IS_ERR(connector))
> -		return PTR_ERR(connector);
> +	if (!connector)
> +		return -EIO;

I think the driver should return -ENODEV if there is no node for the
connector.

thanks,

-- 
heikki
