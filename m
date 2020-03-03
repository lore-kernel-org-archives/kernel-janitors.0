From: David Miller <davem@davemloft.net>
Date: Tue, 03 Mar 2020 22:56:03 +0000
Subject: Re: [PATCH] octeontx2-af: fix spelling mistake "backpessure" -> "backpressure"
Message-Id: <20200303.145603.153230929931919209.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303075437.6704-1-colin.king@canonical.com>
In-Reply-To: <20200303075437.6704-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  3 Mar 2020 07:54:37 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Please specify the appropriate target tree in your patch submissions,
this patch only applies to net-next because that's the only place
where the octeontx2-af changes exist that you are changing.

Applied, thank you.
