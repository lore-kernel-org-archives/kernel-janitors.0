From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 07 Aug 2019 21:23:41 +0000
Subject: Re: [PATCH][next] clk: Si5341/Si5340: remove redundant assignment to n_den
Message-Id: <20190807212342.ABD8921743@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701165020.19840-1-colin.king@canonical.com>
In-Reply-To: <20190701165020.19840-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-07-01 09:50:20)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable n_den is initialized however that value is never read
> as n_den is re-assigned a little later in the two paths of a
> following if-statement.  Remove the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
