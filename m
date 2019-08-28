From: merez@codeaurora.org
Date: Wed, 28 Aug 2019 07:44:46 +0000
Subject: Re: [PATCH] wil6210: Delete an unnecessary kfree() call in wil_tid_ampdu_rx_alloc()
Message-Id: <6eea96653c83cffe648465bc8b953913@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b9620e49-618d-b392-6456-17de5807df75@web.de>
In-Reply-To: <b9620e49-618d-b392-6456-17de5807df75@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, wil6210@qti.qualcomm.com, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless-owner@vger.kernel.org

On 2019-08-27 17:44, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 27 Aug 2019 16:39:02 +0200
> 
> A null pointer would be passed to a call of the function “kfree”
> directly after a call of the function “kcalloc” failed at one place.
> Remove this superfluous function call.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Reviewed-by: Maya Erez <merez@codeaurora.org>

-- 
Maya Erez
Qualcomm Israel, Inc. on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
