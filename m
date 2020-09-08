From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 08 Sep 2020 10:53:46 +0000
Subject: Re: [PATCH] phy: ti: am654: Fix a leak in serdes_am654_probe()
Message-Id: <20200908105319.GE77521@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905124648.GA183976@mwanda>
In-Reply-To: <20200905124648.GA183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05-09-20, 15:46, Dan Carpenter wrote:
> If devm_phy_create() fails then we need to call of_clk_del_provider(node)
> to undo the call to of_clk_add_provider().

Applied, thanks

-- 
~Vinod
