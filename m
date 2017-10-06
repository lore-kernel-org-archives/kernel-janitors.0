From: David Miller <davem@davemloft.net>
Date: Fri, 06 Oct 2017 04:27:12 +0000
Subject: Re: [PATCH] net: qcom/emac: make function emac_isr static
Message-Id: <20171005.212712.1114511156589357681.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005091023.27781-1-colin.king@canonical.com>
In-Reply-To: <20171005091023.27781-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: timur@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Oct 2017 10:10:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function emac_isr is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warnings:
> symbol 'emac_isr' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
