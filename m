From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 03 Dec 2018 17:55:28 +0000
Subject: Re: [PATCH] clk: mmp: Off by one in mmp_clk_add()
Message-Id: <154385972893.88331.5957151241120598045@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
In-Reply-To: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Xie <chao.xie@marvell.com>, Dan Carpenter <dan.carpenter@oracle.com>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:51:43)
> The > comparison should be >= or we write one element beyond the end of
> the unit->clk_table[] array.
> 
> (The unit->clk_table[] array is allocated in the mmp_clk_init() function
> and it has unit->nr_clks elements).
> 
> Fixes: 4661fda10f8b ("clk: mmp: add basic support functions for DT support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes
