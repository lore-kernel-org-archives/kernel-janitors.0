From: Nathan Chancellor <natechancellor@gmail.com>
Date: Fri, 06 Nov 2020 09:51:46 +0000
Subject: Re: [PATCH] clk: remove unneeded dead-store initialization
Message-Id: <20201106095146.GA3269500@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org

On Fri, Nov 06, 2020 at 10:48:20AM +0100, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   drivers/clk/clk.c:423:19:
>   warning: Value stored to 'parent' during its initialization is never read
>   [clang-analyzer-deadcode.DeadStores]
>           struct clk_core *parent = ERR_PTR(-ENOENT);
>                            ^
> 
> Commit fc0c209c147f ("clk: Allow parents to be specified without string
> names") introduced clk_core_fill_parent_index() with this unneeded
> dead-store initialization.
> 
> So, simply remove this unneeded dead-store initialization to make
> clang-analyzer happy.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Indeed, parent is always assigned a new value before that one is read.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201106
> 
> Stephen, Michael, please pick this minor non-urgent clean-up patch.
> 
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f83dac54ed85..ba35bf35bcd3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -420,7 +420,7 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
>  static void clk_core_fill_parent_index(struct clk_core *core, u8 index)
>  {
>  	struct clk_parent_map *entry = &core->parents[index];
> -	struct clk_core *parent = ERR_PTR(-ENOENT);
> +	struct clk_core *parent;
>  
>  	if (entry->hw) {
>  		parent = entry->hw->core;
> -- 
> 2.17.1
> 
