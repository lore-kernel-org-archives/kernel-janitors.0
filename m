From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 15 May 2018 21:04:23 +0000
Subject: Re: [PATCH 05/61] clk: samsung: simplify getting .drvdata
Message-Id: <152641826350.237094.15477833672849994762@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
 <CGME20180515093219epcas1p28a5fa4be53b9ea0fd85e4726cf92f804@epcas1p2.samsung.com>
 <93ee0d94-81aa-db81-2bff-87f5f91bc9d3@samsung.com>
In-Reply-To: <93ee0d94-81aa-db81-2bff-87f5f91bc9d3@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Quoting Sylwester Nawrocki (2018-05-15 02:32:12)
> On 04/19/2018 04:05 PM, Wolfram Sang wrote:
> > We should get drvdata from struct device directly. Going via
> > platform_device is an unneeded step back and forth.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> It seems to be the only clk/samsung patch in the v4.18 queue, please
> feel free to apply it directly.

Ok. I'll pick it up.
