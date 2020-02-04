From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 04 Feb 2020 07:03:53 +0000
Subject: Re: [PATCH][next] clk: ls1028a: fix a dereference of pointer 'parent' before a null check
Message-Id: <20200204070354.AB16A20674@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200203223736.99645-1-colin.king@canonical.com>
In-Reply-To: <20200203223736.99645-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, Michael Walle <michael@walle.cc>, Wen He <wen.he_1@nxp.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-02-03 14:37:36)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the pointer 'parent' is being dereferenced before it is
> being null checked. Fix this by performing the null check before
> it is dereferenced.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: d37010a3c162 ("clk: ls1028a: Add clock driver for Display output interface")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
