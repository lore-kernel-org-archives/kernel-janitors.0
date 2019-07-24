From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Jul 2019 11:44:42 +0000
Subject: Re: [PATCH] libertas: remove redundant assignment to variable ret
Message-Id: <20190724114443.3839860867@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705081734.15292-1-colin.king@canonical.com>
In-Reply-To: <20190705081734.15292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

4c8a46851019 libertas: remove redundant assignment to variable ret

-- 
https://patchwork.kernel.org/patch/11032181/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
