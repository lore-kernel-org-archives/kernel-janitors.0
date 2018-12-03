From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 03 Dec 2018 17:55:33 +0000
Subject: Re: [PATCH] clk: zynqmp: Off by one in zynqmp_is_valid_clock()
Message-Id: <154385973379.88331.800153887588886721@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
In-Reply-To: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jolly Shah <jolly.shah@xilinx.com>, Michael Turquette <mturquette@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Rajan Vaja <rajan.vaja@xilinx.com>, Tejas Patel <tejasp@xilinx.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:52:01)
> The > comparison should be >= to prevent reading beyond the end of the
> clock[] array.
> 
> (The clock[] array is allocated in zynqmp_clk_setup() and has
> clock_max_idx elements.)
> 
> Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes
