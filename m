From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 07 Dec 2020 16:34:34 +0000
Subject: Re: [PATCH][next] wilc1000: remove redundant assignment to pointer vif
Message-Id: <20201207163434.8D3C9C433ED@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201203174316.1071446-1-colin.king@canonical.com>
In-Reply-To: <20201203174316.1071446-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to pointer vif is redundant as the assigned value
> is never read, hence it can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Ajay Singh <ajay.kathat@microchip.com>

Patch applied to wireless-drivers-next.git, thanks.

9b0467ed9a7d wilc1000: remove redundant assignment to pointer vif

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201203174316.1071446-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
