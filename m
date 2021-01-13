From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 Jan 2021 12:13:09 +0000
Subject: Re: [PATCH] phy: cadence-torrent: Fix error code in cdns_torrent_phy_probe()
Message-Id: <20210113120109.GG2771@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9s7Wxq+b6ls0q7o@mwanda>
In-Reply-To: <X9s7Wxq+b6ls0q7o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>, Yuti Amonkar <yamonkar@cadence.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 17-12-20, 14:04, Dan Carpenter wrote:
> This error path should return -EINVAL, but currently it returns
> success.

Applied, thanks

-- 
~Vinod
