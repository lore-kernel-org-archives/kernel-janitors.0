From: David Miller <davem@davemloft.net>
Date: Sat, 15 Jun 2019 02:21:48 +0000
Subject: Re: [PATCH net] net: phy: sfp: clean up a condition
Message-Id: <20190614.192148.1227986231677887217.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065102.GA16334@mwanda>
In-Reply-To: <20190613065102.GA16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux@armlinux.org.uk, ruslan@babayev.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 09:51:02 +0300

> The acpi_node_get_property_reference() doesn't return ACPI error codes,
> it just returns regular negative kernel error codes.  This patch doesn't
> affect run time, it's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next.
