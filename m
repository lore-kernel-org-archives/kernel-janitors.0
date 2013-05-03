From: "David Laight" <David.Laight@ACULAB.COM>
Date: Fri, 03 May 2013 08:23:49 +0000
Subject: RE: [patch] usbnet: pegasus: endian bug in write_mii_word()
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B7223@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130503064420.GA14069@elgon.mountain>
In-Reply-To: <20130503064420.GA14069@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Petko Manolov <petkan@nucleusys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> We're only passing the two high bits of an integer.  It works for little
                                  ^^^^ bytes
> endian but not for big endian.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index 0969905..03e8a15 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -256,8 +256,9 @@ static int mdio_read(struct net_device *dev, int phy_id, int loc)
>  static void mdio_write(struct net_device *dev, int phy_id, int loc, int val)
>  {
>  	pegasus_t *pegasus = netdev_priv(dev);
> +	u16 data = val;
> 
> -	write_mii_word(pegasus, phy_id, loc, (__u16 *)&val);
> +	write_mii_word(pegasus, phy_id, loc, &data);
>  }
> 
>  static int read_eprom_word(pegasus_t *pegasus, __u8 index, __u16 *retdata)
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


