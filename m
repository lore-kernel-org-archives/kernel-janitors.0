From: David Miller <davem@davemloft.net>
Date: Tue, 24 Apr 2018 01:03:02 +0000
Subject: Re: [PATCH] dca: make function dca_common_get_tag static
Message-Id: <20180423.210302.2026905592349874072.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180423124938.26070-1-colin.king@canonical.com>
In-Reply-To: <20180423124938.26070-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 23 Apr 2018 13:49:38 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Function dca_common_get_tag is local to the source and does not need to be
> in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/dca/dca-core.c:273:4: warning: symbol 'dca_common_get_tag' was
> not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
