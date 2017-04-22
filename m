From: Stephen Boyd <sboyd@codeaurora.org>
Date: Sat, 22 Apr 2017 02:45:11 +0000
Subject: Re: [PATCH 2/8] clk: si5351: Delete an error message for a failed memory allocation in si5351_i2c_pr
Message-Id: <20170422024511.GL7065@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <2a7dd521-86bb-09b8-d49d-7518b51094ea@users.sourceforge.net>
In-Reply-To: <2a7dd521-86bb-09b8-d49d-7518b51094ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Apr 2017 07:34:54 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> * CHECK: Comparison to NULL could be written "!drvdata"
> 
>   Thus adjust this expression.
> 
> 
> * WARNING: Possible unnecessary 'out of memory' message
> 
>   Thus remove such a statement here.
> 
>   Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
