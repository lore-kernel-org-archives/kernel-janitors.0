From: Kenneth Westfield <kwestfie@codeaurora.org>
Date: Thu, 03 Sep 2015 21:19:01 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: qcom: change PTR_ERR argument
Message-Id: <20150903211900.GA9014@kwestfie-linux.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Patrick Lai <plai@codeaurora.org>, alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Sun, Aug 30, 2015 at 11:05:10AM -0700, Julia Lawall wrote:
> Apply PTR_ERR to the value that was recently assigned.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,y;
> @@
> 
> if (IS_ERR(x) || ...) {
>   ... when any
>       when != IS_ERR(...)
> (
>    PTR_ERR(x)
> |
> *  PTR_ERR(y)
> )
>   ... when any
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

The patch itself looks good.  Thanks.

Acked-by: Kenneth Westfield <kwestfie@codeaurora.org>

-- 
Kenneth Westfield
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
