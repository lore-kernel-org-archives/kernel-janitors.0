From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Jul 2019 11:45:43 +0000
Subject: Re: [PATCH] wl3501_cs: remove redundant variable rc
Message-Id: <20190724114543.C71D160398@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705103732.30568-1-colin.king@canonical.com>
In-Reply-To: <20190705103732.30568-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being initialized with a value that is never
> read and it is being updated later with a new value that is returned.
> The variable is redundant and can be replaced with a return 0 as
> there are no other return points in this function.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

c032461936de wl3501_cs: remove redundant variable rc

-- 
https://patchwork.kernel.org/patch/11032441/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
