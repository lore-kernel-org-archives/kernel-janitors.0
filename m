From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 22 Feb 2019 18:00:48 +0000
Subject: Re: [PATCH] clk: qoriq: Improve an error message
Message-Id: <155085844841.77512.11794519377167979747@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218091906.GA7712@kadam>
In-Reply-To: <20190218091906.GA7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Michael Turquette <mturquette@baylibre.com>, Yuantian Tang <andy.tang@nxp.com>
Cc: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2019-02-18 01:19:06)
> We intended to print "ret" but there is a copy and paste bug from the
> previous error message.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next
