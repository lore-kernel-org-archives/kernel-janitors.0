From: Vinod Koul <vinod.koul@intel.com>
Date: Sun, 22 Apr 2018 06:29:33 +0000
Subject: Re: [PATCH 07/61] dma: simplify getting .drvdata
Message-Id: <20180422061733.GU6014@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Dan Williams <dan.j.williams@intel.com>, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Thu, Apr 19, 2018 at 04:05:37PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.

Do you mind splitting this per driver please, that makes it easy to manage
for me :)

-- 
~Vinod
