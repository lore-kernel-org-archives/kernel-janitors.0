From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 28 May 2020 23:00:54 +0000
Subject: Re: [PATCH][next] clk: intel: remove redundant initialization of variable rate64
Message-Id: <159070685467.69627.16613075011399178571@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528221219.535804-1-colin.king@canonical.com>
In-Reply-To: <20200528221219.535804-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, Rahul Tanwar <rahul.tanwar@linux.intel.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-05-28 15:12:19)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rate64 is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
