From: maowenan <maowenan@huawei.com>
Date: Wed, 08 Feb 2017 01:28:34 +0000
Subject: RE: [bug report] net: phy: Fix lack of reference count on PHY driver
Message-Id: <F95AC9340317A84688A5F0DF0246F3F201ED9B48@szxemi502-mbx.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207105000.GA30406@mwanda>
In-Reply-To: <20170207105000.GA30406@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thank you very much , there should be pointer checked before dereference.


> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, February 07, 2017 6:50 PM
> To: maowenan
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] net: phy: Fix lack of reference count on PHY driver
> 
> Hello Mao Wenan,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch cafe8df8b9bc: "net: phy: Fix lack of reference count on PHY driver"
> from Jan 31, 2017, leads to the following Smatch complaint:
> 
> drivers/net/phy/phy_device.c:933 phy_attach_direct()
> 	 warn: variable dereferenced before check 'd->driver' (see line 923)
> 
> drivers/net/phy/phy_device.c
>    922
>    923		if (!try_module_get(d->driver->owner)) {
>                                     ^^^^^^^^^^^ Patch introduces a
> new dereference.
> 
>    924			dev_err(&dev->dev, "failed to get the device driver
> module\n");
>    925			return -EIO;
>    926		}
>    927
>    928		get_device(d);
>    929
>    930		/* Assume that if there is no driver, that it doesn't
>    931		 * exist, and we should use the genphy driver.
>    932		 */
>    933		if (!d->driver) {
>                      ^^^^^^^^^
> Existing code assumed d->driver could be NULL.
> 
>    934			if (phydev->is_c45)
>    935				d->driver > 
> regards,
> dan carpenter
