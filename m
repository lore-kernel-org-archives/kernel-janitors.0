From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Thu, 13 Jun 2019 18:00:16 +0000
Subject: Re: [PATCH net] net: phy: sfp: clean up a condition
Message-Id: <20190613180016.ekg55vzkuczapfpl@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065102.GA16334@mwanda>
In-Reply-To: <20190613065102.GA16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ruslan Babayev <ruslan@babayev.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 09:51:02AM +0300, Dan Carpenter wrote:
> The acpi_node_get_property_reference() doesn't return ACPI error codes,
> it just returns regular negative kernel error codes.  This patch doesn't
> affect run time, it's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/phy/sfp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index a991c80e6567..8a99307c1c39 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -1848,7 +1848,7 @@ static int sfp_probe(struct platform_device *pdev)
>  		int ret;
>  
>  		ret = acpi_node_get_property_reference(fw, "i2c-bus", 0, &args);
> -		if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
> +		if (ret || !is_acpi_device_node(args.fwnode)) {
>  			dev_err(&pdev->dev, "missing 'i2c-bus' property\n");
>  			return -ENODEV;

If "ret" is a Linux error code, should we print its value when reporting
the error so we know why the failure occurred, and propagate the error
code?

>  		}
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
