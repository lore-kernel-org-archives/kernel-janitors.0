From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Thu, 19 Apr 2018 16:22:33 +0000
Subject: Re: [PATCH 02/61] ata: simplify getting .drvdata
Message-Id: <c486565a-d3f3-2ce0-eca2-3aa60a6c99b2@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org

Hello!

On 04/19/2018 05:05 PM, Wolfram Sang wrote:

> We should get drvdata from struct device directly. Going via

  Note that the name of the field in the 'struct device' is driver_data,
not drvdata. Otherwise the patch looks good.

> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

MBR, Sergei
