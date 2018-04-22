From: Vinod Koul <vinod.koul@intel.com>
Date: Sun, 22 Apr 2018 06:34:14 +0000
Subject: Re: [PATCH 08/61] dmaengine: dw: simplify getting .drvdata
Message-Id: <20180422062214.GW6014@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org

On Thu, Apr 19, 2018 at 04:05:38PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.

Applied, thanks

-- 
~Vinod
