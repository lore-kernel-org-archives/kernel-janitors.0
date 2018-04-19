From: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Thu, 19 Apr 2018 15:14:40 +0000
Subject: Re: [PATCH 35/61] net: ethernet: ti: simplify getting .drvdata
Message-Id: <08a08b63-976a-dda5-229a-b79a18eb80d7@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-36-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-36-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org, netdev@vger.kernel.org



On 04/19/2018 09:06 AM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
