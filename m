From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 04 Oct 2019 13:46:41 +0000
Subject: Re: [PATCH] libertas: remove redundant assignment to variable ret
Message-Id: <20191004134641.62F9D61A37@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002101517.10836-1-colin.king@canonical.com>
In-Reply-To: <20191002101517.10836-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned a value that is never read and is
> being re-assigned a little later on. The assignment is redundant and hence
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

60b5b49f6a6e libertas: remove redundant assignment to variable ret

-- 
https://patchwork.kernel.org/patch/11170731/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
