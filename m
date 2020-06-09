From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 09 Jun 2020 20:45:39 +0000
Subject: Re: [PATCH] clk: baikal-t1: remove redundant assignment to variable 'divider'
Message-Id: <159173553955.242598.16478893358446362532@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602172435.70282-1-colin.king@canonical.com>
In-Reply-To: <20200602172435.70282-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-06-02 10:24:35)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable divider is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
