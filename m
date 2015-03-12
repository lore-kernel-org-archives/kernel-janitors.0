From: Stephen Boyd <sboyd@codeaurora.org>
Date: Thu, 12 Mar 2015 06:03:44 +0000
Subject: Re: [PATCH 9/15] clk: don't export static symbol
Message-Id: <20150312060344.GA17325@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
 <1426092997-30605-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Mike Turquette <mturquette@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net

On 03/11, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> type T;
> identifier f;
> @@
> 
> static T f (...) { ... }
> 
> @@
> identifier r.f;
> declarer name EXPORT_SYMBOL_GPL;
> @@
> 
> -EXPORT_SYMBOL_GPL(f);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to clk-fixes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
