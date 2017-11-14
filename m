From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 01:58:08 +0000
Subject: Re: [PATCH 2/4] clk-u300: Improve a size determination in two functions
Message-Id: <20171114015808.GH11955@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
 <781271c5-482f-d4da-e91e-3b048bac69c2@users.sourceforge.net>
In-Reply-To: <781271c5-482f-d4da-e91e-3b048bac69c2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 19:33:02 +0200
> 
> Replace the specification of data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
