From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 01:58:44 +0000
Subject: Re: [PATCH 2/2] clk-xgene: Adjust six checks for null pointers
Message-Id: <20171114015844.GJ11955@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
 <c7cfc7bc-8457-1e6b-421d-6c4f0b5149a6@users.sourceforge.net>
In-Reply-To: <c7cfc7bc-8457-1e6b-421d-6c4f0b5149a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 21:27:52 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written …
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
