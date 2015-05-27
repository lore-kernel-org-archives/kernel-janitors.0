From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 27 May 2015 17:33:31 +0000
Subject: Re: [patch -next] ARM: BCM63xx: fix an error path in bcm63xx_pmb_power_on_cpu()
Message-Id: <5565FFEB.7090207@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150527082512.GC19423@mwanda>
In-Reply-To: <20150527082512.GC19423@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 27/05/15 01:25, Dan Carpenter wrote:
> We need to unlock and unmap some resourses before returning.
> 
> Fixes: 3f2a43c98d72 ('ARM: BCM63xx: Add secondary CPU PMB initialization sequence')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to bcm/soc, thanks Dan!
-- 
Florian
