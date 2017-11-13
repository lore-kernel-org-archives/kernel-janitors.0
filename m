From: David Miller <davem@davemloft.net>
Date: Mon, 13 Nov 2017 01:08:53 +0000
Subject: Re: [PATCH] net: realtek: r8169: remove redundant assignment to giga_ctrl
Message-Id: <20171113.100853.145554446239802065.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108132323.26292-1-colin.king@canonical.com>
In-Reply-To: <20171108132323.26292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: nic_swsd@realtek.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  8 Nov 2017 13:23:23 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable giga_ctrl is being assigned to zero however this is
> never read and hence the assignment is redundant, so remove it.
> Cleans up clang warning:
> 
> drivers/net/ethernet/realtek/r8169.c:1978:3: warning: Value stored
> to 'giga_ctrl' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
