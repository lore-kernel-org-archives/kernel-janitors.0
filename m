From: David Miller <davem@davemloft.net>
Date: Mon, 09 Dec 2019 22:28:46 +0000
Subject: Re: [PATCH][V2][RESEND] qed: remove redundant assignments to rc
Message-Id: <20191209.142846.388476377747170130.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191209131607.71580-1-colin.king@canonical.com>
In-Reply-To: <20191209131607.71580-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  9 Dec 2019 13:16:07 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is assigned with a value that is never read and
> it is re-assigned a new value later on.  The assignment is redundant
> and can be removed.  Clean up multiple occurrances of this pattern.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
