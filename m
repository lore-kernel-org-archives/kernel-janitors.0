From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 04 Apr 2019 10:15:04 +0000
Subject: Re: [PATCH] iwlegacy: remove redundant assignment to *res
Message-Id: <20190404101505.28B0E61B5F@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330201422.8024-1-colin.king@canonical.com>
In-Reply-To: <20190330201422.8024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently 1 is being assigned to *res and then it is immediately
> updated with the computed result.  The first assignment is
> redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Patch applied to wireless-drivers-next.git, thanks.

6603c5844a44 iwlegacy: remove redundant assignment to *res

-- 
https://patchwork.kernel.org/patch/10878565/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
