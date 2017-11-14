From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 01:58:10 +0000
Subject: Re: [PATCH 1/4] clk-u300: Delete an error message for a failed memory allocation in two functions
Message-Id: <20171114015810.GI11955@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
 <786e8b0c-a208-8ced-a566-905bae6ca394@users.sourceforge.net>
In-Reply-To: <786e8b0c-a208-8ced-a566-905bae6ca394@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 19:30:46 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
