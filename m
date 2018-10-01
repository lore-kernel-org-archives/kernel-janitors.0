From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 01 Oct 2018 15:49:03 +0000
Subject: Re: [PATCH] ipw2x00: clean up clang warning on extraneous parentheses
Message-Id: <20181001154903.466F660866@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180930223809.18136-1-colin.king@canonical.com>
In-Reply-To: <20180930223809.18136-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are extraneous parantheses that are causing clang to produce a
> warning so remove these.
> 
> Clean up clang warning:
> equality comparison with extraneous parentheses [-Wparentheses-equality]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I applied an identical patch few minutes ago:

c15ace868dd1 ipw2x00: Remove unnecessary parentheses

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/10621549/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
