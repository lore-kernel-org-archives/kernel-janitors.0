From: Stephen Boyd <sboyd@kernel.org>
Date: Sat, 14 Nov 2020 20:32:34 +0000
Subject: Re: [PATCH] clk: remove unneeded dead-store initialization
Message-Id: <160538595432.60232.9813667976586248163@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org

Quoting Lukas Bulwahn (2020-11-06 01:48:20)
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
> ---

Applied to clk-next
