From: David Miller <davem@davemloft.net>
Date: Wed, 07 Mar 2018 18:25:51 +0000
Subject: Re: [PATCH][net-next] net: mvpp2: make function mvpp2_check_hw_buf_num static
Message-Id: <20180307.132551.1339524852801277076.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306152517.2770-1-colin.king@canonical.com>
In-Reply-To: <20180306152517.2770-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: antoine.tenart@bootlin.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  6 Mar 2018 16:25:17 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function mvpp2_check_hw_buf_num is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/net/ethernet/marvell/mvpp2.c:4298:5: warning: symbol
> 'mvpp2_check_hw_buf_num' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Someone else submitted this already, but thanks for the submission.
