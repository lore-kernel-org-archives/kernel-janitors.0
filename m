From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 01:58:47 +0000
Subject: Re: [PATCH 1/2] clk-xgene: Delete an error message for a failed memory allocation in two functions
Message-Id: <20171114015847.GK11955@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
 <2a6fb281-932f-e043-f084-355a3020411a@users.sourceforge.net>
In-Reply-To: <2a6fb281-932f-e043-f084-355a3020411a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 21:19:19 +0200
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
