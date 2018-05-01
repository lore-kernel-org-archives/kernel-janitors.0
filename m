From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 01 May 2018 21:50:20 +0000
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in npcm7xx_clk_init()
Message-Id: <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Wei Yongjun (2018-04-26 04:21:08)
> In case of error, the function ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Have you made this into a scripts/coccinelle/ script I can run?

Applied to clk-next
