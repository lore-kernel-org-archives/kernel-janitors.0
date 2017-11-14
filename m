From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 01:59:16 +0000
Subject: Re: [PATCH] clk/ti: Delete an error message for a failed memory allocation in two functions
Message-Id: <20171114015916.GO11955@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <120d01e4-5e58-e740-f6c7-c6835752aed3@users.sourceforge.net>
In-Reply-To: <120d01e4-5e58-e740-f6c7-c6835752aed3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Tero Kristo <t-kristo@ti.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 19:14:01 +0200
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
