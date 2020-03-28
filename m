From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 28 Mar 2020 15:46:17 +0000
Subject: Re: [PATCH] MAINTAINERS: clarify maintenance of ARM Dove drivers
Message-Id: <20200328154617.GX3819@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328134304.7317-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200328134304.7317-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@bootlin.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Sat, Mar 28, 2020 at 02:43:04PM +0100, Lukas Bulwahn wrote:
> Commit 44e259ac909f ("ARM: dove: create a proper PMU driver for power
> domains, PMU IRQs and resets") introduced new drivers for the ARM Dove SOC,
> but did not add those drivers to the existing entry ARM/Marvell
> Dove/MV78xx0/Orion SOC support in MAINTAINERS. Hence, these drivers were
> considered to be part of "THE REST".
> 
> Clarify now that these drivers are maintained by the ARM/Marvell
> Dove/MV78xx0/Orion SOC support maintainers. Also order the T: entry to the
> place it belongs to, while at it.
> 
> This was identified with a small script that finds all files only belonging
> to "THE REST" according to the current MAINTAINERS file, and I acted upon
> its output.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
