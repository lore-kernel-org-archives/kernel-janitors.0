From: Stephen Boyd <sboyd@codeaurora.org>
Date: Sat, 22 Apr 2017 02:49:21 +0000
Subject: Re: [PATCH 1/5] clk: mvebu: Use kcalloc() in of_cpu_clk_setup()
Message-Id: <20170422024921.GQ7065@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
 <9377530b-9b07-bfc6-848c-b0c1994e33f7@users.sourceforge.net>
In-Reply-To: <9377530b-9b07-bfc6-848c-b0c1994e33f7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 04/19, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 20:15:21 +0200
> 
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "kcalloc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
