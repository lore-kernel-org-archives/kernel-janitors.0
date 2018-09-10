From: David Miller <davem@davemloft.net>
Date: Mon, 10 Sep 2018 17:01:34 +0000
Subject: Re: [PATCH][next] cxgb4: remove redundant assignment to vlan_cmd.dropnovlan_fm
Message-Id: <20180910.100134.1463498001968586861.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180910121722.15524-1-colin.king@canonical.com>
In-Reply-To: <20180910121722.15524-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: ganeshgr@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Sep 2018 13:17:22 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent commit updated vlan_cmd.dropnovlan_fm but failed to remove
> the older assignment.  Fix this by removing the former redundant
> assignment.
> 
> Detected by CoverityScan, CID#1473290 ("Unused value")
> 
> Fixes: a89cdd8e7c74 ("cxgb4: impose mandatory VLAN usage when non-zero TAG ID")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
