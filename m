From: David Miller <davem@davemloft.net>
Date: Mon, 26 Mar 2018 16:11:45 +0000
Subject: Re: [PATCH] net: qualcomm: rmnet: check for null ep to avoid null pointer dereference
Message-Id: <20180326.121145.136604200411684413.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323235157.8129-1-colin.king@canonical.com>
In-Reply-To: <20180323235157.8129-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: subashab@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Mar 2018 23:51:57 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to rmnet_get_endpoint can potentially return NULL so check
> for this to avoid any subsequent null pointer dereferences on a NULL
> ep.
> 
> Detected by CoverityScan, CID#1465385 ("Dereference null return value")
> 
> Fixes: 23790ef12082 ("net: qualcomm: rmnet: Allow to configure flags for existing devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
