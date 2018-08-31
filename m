From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 31 Aug 2018 01:29:58 +0000
Subject: Re: [PATCH] clk: mediatek: remove unused array audio_parents
Message-Id: <153567899849.93865.4205043107104480951@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180806134402.1055-1-colin.king@canonical.com>
In-Reply-To: <20180806134402.1055-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Quoting Colin King (2018-08-06 06:44:02)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Array audio_parents is declared but never used, hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: 'audio_parents' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
