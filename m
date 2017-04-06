From: David Miller <davem@davemloft.net>
Date: Thu, 06 Apr 2017 20:24:57 +0000
Subject: Re: [PATCH] qed: fix missing break in OOO_LB_TC case
Message-Id: <20170406.132457.208185850211874734.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170405123544.18648-1-colin.king@canonical.com>
In-Reply-To: <20170405123544.18648-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Yuval.Mintz@cavium.com, Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  5 Apr 2017 13:35:44 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> There seems to be a missing break on the OOO_LB_TC case, pq_id
> is being assigned and then re-assigned on the fall through default
> case and that seems suspect.
> 
> Detected by CoverityScan, CID#1424402 ("Missing break in switch")
> 
> Fixes: b5a9ee7cf3be1 ("qed: Revise QM cofiguration")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
