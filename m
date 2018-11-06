From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Nov 2018 17:03:00 +0000
Subject: Re: [PATCH] wireless: airo: potential buffer overflow in sprintf()
Message-Id: <20181106170300.7E7DF6038E@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181024083334.a6pxsifew3iztuun@kili.mountain>
In-Reply-To: <20181024083334.a6pxsifew3iztuun@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> It looks like we wanted to print a maximum of BSSList_rid.ssidLen bytes
> of the ssid, but we accidentally use "%*s" (width) instead of "%.*s"
> (precision) so if the ssid doesn't have a NUL terminator this could lead
> to an overflow.
> 
> Static analysis.  Not tested.
> 
> Fixes: e174961ca1a0 ("net: convert print_mac to %pM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

3d39e1bb1c88 wireless: airo: potential buffer overflow in sprintf()

-- 
https://patchwork.kernel.org/patch/10654389/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
