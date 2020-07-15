From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 15 Jul 2020 10:40:15 +0000
Subject: Re: [PATCH] iwlegacy: remove redundant initialization of variable tid
Message-Id: <20200715104015.4BE75C43391@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200701135221.549700-1-colin.king@canonical.com>
In-Reply-To: <20200701135221.549700-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tid is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

ddfa943f246a iwlegacy: remove redundant initialization of variable tid

-- 
https://patchwork.kernel.org/patch/11636467/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
