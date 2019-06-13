From: Ruslan Babayev <ruslan@babayev.com>
Date: Thu, 13 Jun 2019 17:54:40 +0000
Subject: Re: [PATCH net] net: phy: sfp: clean up a condition
Message-Id: <87pnnh9xr3.fsf@babayev.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065102.GA16334@mwanda>
In-Reply-To: <20190613065102.GA16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Russell King <linux@armlinux.org.uk>, Ruslan Babayev <ruslan@babayev.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan Carpenter writes:

> The acpi_node_get_property_reference() doesn't return ACPI error codes,
> it just returns regular negative kernel error codes.  This patch doesn't
> affect run time, it's just a clean up.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Ruslan Babayev <ruslan@babayev.com>
