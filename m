From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 29 Apr 2019 14:49:46 +0000
Subject: Re: [PATCH] ath6kl: add some bounds checking
Message-Id: <20190429144946.9D5E660134@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404085651.GC20193@kadam>
In-Reply-To: <20190404085651.GC20193@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "ev->traffic_class" and "reply->ac" variables come from the network
> and they're used as an offset into the wmi->stream_exist_for_ac[] array.
> Those variables are u8 so they can be 0-255 but the stream_exist_for_ac[]
> array only has WMM_NUM_AC (4) elements.  We need to add a couple bounds
> checks to prevent array overflows.
> 
> I also modified one existing check from "if (traffic_class > 3) {" to
> "if (traffic_class >= WMM_NUM_AC) {" just to make them all consistent.
> 
> Fixes: bdcd81707973 (" Add ath6kl cleaned up driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5d6751eaff67 ath6kl: add some bounds checking

-- 
https://patchwork.kernel.org/patch/10885299/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
