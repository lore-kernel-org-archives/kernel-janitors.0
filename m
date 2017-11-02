From: David Miller <davem@davemloft.net>
Date: Thu, 02 Nov 2017 06:53:55 +0000
Subject: Re: [PATCH] net: dl2k: remove redundant re-assignment to np
Message-Id: <20171102.155355.680097222661424519.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171101085737.14967-1-colin.king@canonical.com>
In-Reply-To: <20171101085737.14967-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: tklauser@distanz.ch, tremyfr@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 Nov 2017 08:57:37 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer np is initialized and then re-assigned the same value
> a few lines later. Remove the redundant duplicated assignment. Cleans
> up clang warning:
> 
> drivers/net/ethernet/dlink/dl2k.c:314:25: warning: Value stored to
> 'np' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
