From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Dec 2017 13:24:57 +0000
Subject: Re: [V2] wlcore, wl1251: fix spelling: "Couldnt" -> "Couldn't" and remove error on
Message-Id: <20171207132457.EF324607E8@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171201100258.10029-1-colin.king@canonical.com>
In-Reply-To: <20171201100258.10029-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in error message text.  Also remove the
> error message on an kzalloc failure as this is redundant.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

c4ee30a280b1 wlcore, wl1251: fix spelling: "Couldnt" -> "Couldn't" and remove error on -ENOMEM

-- 
https://patchwork.kernel.org/patch/10086741/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

