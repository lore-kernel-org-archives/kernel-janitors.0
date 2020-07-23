From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 23 Jul 2020 01:46:37 +0000
Subject: Re: [PATCH][next] clk: vc5: fix use of memory after it has been kfree'd
Message-Id: <159546879710.3847286.14955586064206205548@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200625132736.88832-1-colin.king@canonical.com>
In-Reply-To: <20200625132736.88832-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Ford <aford173@gmail.com>, Colin King <colin.king@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-06-25 06:27:36)
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a several places where printing an error message of
> init.name occurs after init.name has been kfree'd. Also the failure
> message is duplicated each time in the code. Fix this by adding
> a registration error failure path for these cases, moving the
> duplicated error messages to one common point and kfree'ing init.name
> only after it has been used.
> 
> Changes also shrink the object code size by 171 bytes (x86-64, gcc 9.3):
> 
> Before:
>    text    data     bss     dec     hex filename
>   21057    3960      64   25081    61f9 drivers/clk/clk-versaclock5.o
> 
> After:
>    text    data     bss     dec     hex filename
>   20886    3960      64   24910    614e drivers/clk/clk-versaclock5.o
> 
> Addresses-Coverity: ("Use after free")
> Fixes: f491276a5168 ("clk: vc5: Allow Versaclock driver to support multiple instances")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
