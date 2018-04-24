From: Will Deacon <will.deacon@arm.com>
Date: Tue, 24 Apr 2018 16:08:39 +0000
Subject: Re: [PATCH 37/61] perf: simplify getting .drvdata
Message-Id: <20180424160839.GD25964@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-38-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-38-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Apr 19, 2018 at 04:06:07PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.

Thanks, Wolfram. I'll pick this up via the arm perf tree.

Will
