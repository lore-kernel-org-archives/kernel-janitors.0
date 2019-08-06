From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Aug 2019 12:37:30 +0000
Subject: Re: [PATCH] ipw2x00: remove redundant assignment to err
Message-Id: <20190806123730.2BCC36074F@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190726100614.6924-1-colin.king@canonical.com>
In-Reply-To: <20190726100614.6924-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is initialized to a value that is never read and it
> is re-assigned later.  The initialization is redundant and can
> be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

937a194ae865 ipw2x00: remove redundant assignment to err

-- 
https://patchwork.kernel.org/patch/11060715/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
