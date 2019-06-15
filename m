From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Jun 2019 07:09:35 +0000
Subject: Re: [PATCH net] net: phy: sfp: clean up a condition
Message-Id: <20190615070935.GM1893@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065102.GA16334@mwanda>
 <20190614.192148.1227986231677887217.davem@davemloft.net>
In-Reply-To: <20190614.192148.1227986231677887217.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: linux@armlinux.org.uk, ruslan@babayev.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 14, 2019 at 07:21:48PM -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Thu, 13 Jun 2019 09:51:02 +0300
> 
> > The acpi_node_get_property_reference() doesn't return ACPI error codes,
> > it just returns regular negative kernel error codes.  This patch doesn't
> > affect run time, it's just a clean up.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied to net-next.

I meant to say net-next but I made a typo.  :/

regards,
dan carpenter
