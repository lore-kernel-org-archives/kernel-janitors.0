From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 20 Sep 2019 19:13:50 +0000
Subject: Re: [PATCH 2/2] net/phy/mdio-mscc-miim: Move the setting of mii_bus structure members in mscc_miim_p
Message-Id: <20190920191350.GI3530@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <fe3ecdd2-a011-e4ed-5ef2-c3a8a02b343c@web.de>
In-Reply-To: <fe3ecdd2-a011-e4ed-5ef2-c3a8a02b343c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 09:03:57PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 20:42:42 +0200
> 
> Move the modification of some members in the data structure “mii_bus”
> for the local variable “bus” directly before the call of
> the function “of_mdiobus_register” so that this change will be performed
> only after previous resource allocations succeeded.

Hi Markus

I'm not sure it is worth making this change. The resource allocations
succeeds 99.9999% of the time. It is a chunk of MMIO, not some gpio,
or i2c device which might give us EPROBE_DEFERRED. So we are not
wasting anything in reality.

	Andrew
