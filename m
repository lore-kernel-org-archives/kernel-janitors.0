From: David Miller <davem@davemloft.net>
Date: Tue, 26 Nov 2019 22:43:23 +0000
Subject: Re: [PATCH] net: phy: dp83869: Fix return paths to return proper values
Message-Id: <20191126.144323.1762864682894965078.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126143856.26451-1-dmurphy@ti.com>
In-Reply-To: <20191126143856.26451-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmurphy@ti.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Murphy <dmurphy@ti.com>
Date: Tue, 26 Nov 2019 08:38:56 -0600

> Fix the return paths for all I/O operations to ensure
> that the I/O completed successfully.  Then pass the return
> to the caller for further processing
> 
> Reported-by: Andrew Lunn <andrew@lunn.ch>
> Fixes: 01db923e8377 ("net: phy: dp83869: Add TI dp83869 phy")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Please specify the Fixes: tag as the first tag in the future.

Applied, thanks.
