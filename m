From: David Miller <davem@davemloft.net>
Date: Sun, 04 Jun 2017 23:59:40 +0000
Subject: Re: [PATCH][net-next] rxrpc: remove redundant proc_remove call
Message-Id: <20170604.195940.396015419684829733.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602152227.3626-1-colin.king@canonical.com>
In-Reply-To: <20170602152227.3626-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dhowells@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  2 Jun 2017 16:22:27 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The proc_remove call is dead code as it occurs after a return and
> hence can never be called. Remove it.
> 
> Detected by CoverityScan, CID#1437743 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
