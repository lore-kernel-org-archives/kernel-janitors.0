From: Stephen Boyd <sboyd@codeaurora.org>
Date: Tue, 27 Sep 2016 22:15:50 +0000
Subject: Re: [PATCH] spmi: pmic-arb: Return an error code if sanity check fails
Message-Id: <20160927221550.GB940@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1474921486-7560-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1474921486-7560-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gregkh@linuxfoundation.org, bjorn.andersson@sonymobile.com, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/26, Christophe JAILLET wrote:
> If the test 'if (channel > 5)' is true, then we will return 'err' which
> is known to be 0 at this point.
> Return -EINVAL instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

Looks right, thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
