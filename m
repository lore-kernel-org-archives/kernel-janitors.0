From: David Miller <davem@davemloft.net>
Date: Thu, 11 May 2017 16:16:33 +0000
Subject: Re: [PATCH] netxen_nic: set rcode to the return status from the call to netxen_issue_cmd
Message-Id: <20170511.121633.1672073434604015576.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170509161942.32383-1-colin.king@canonical.com>
In-Reply-To: <20170509161942.32383-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: manish.chopra@cavium.com, rahul.verma@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  9 May 2017 17:19:42 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently rcode is being initialized to NX_RCODE_SUCCESS and later it
> is checked to see if it is not NX_RCODE_SUCCESS which is never true. It
> appears that there is an unintentional missing assignment of rcode from
> the return of the call to netxen_issue_cmd() that was dropped in
> an earlier fix, so add it in.
> 
> Detected by CoverityScan, CID#401900 ("Logically dead code")
> 
> Fixes: 2dcd5d95ad6b2 ("netxen_nic: fix cdrp race condition")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
