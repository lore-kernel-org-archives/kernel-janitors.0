From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Dec 2018 09:55:45 +0000
Subject: [bug report] phy: ti: introduce phy-gmii-sel driver
Message-Id: <20181214094117.GA12567@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Grygorii Strashko,

This is a semi-automatic email about new static checker warnings.

The patch 92b58b34741f: "phy: ti: introduce phy-gmii-sel driver" from 
Nov 25, 2018, leads to the following Smatch complaint:

    drivers/phy/ti/phy-gmii-sel.c:210 phy_gmii_sel_of_xlate()
    warn: variable dereferenced before check 'priv' (see line 207)

drivers/phy/ti/phy-gmii-sel.c
   206			return ERR_PTR(-EINVAL);
   207		if (priv->soc_data->features & BIT(PHY_GMII_SEL_RMII_IO_CLK_EN) &&
                    ^^^^^^^^^^^^^^
dereference

   208		    args->args_count < 2)
   209			return ERR_PTR(-EINVAL);
   210		if (!priv || !priv->if_phys)
                    ^^^^^
Too late.  Can priv even be NULL?  Should this condition be removed?

   211			return ERR_PTR(-ENODEV);
   212		if (phy_id > priv->soc_data->num_ports)

regards,
dan carpenter
