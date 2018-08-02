From: David Miller <davem@davemloft.net>
Date: Thu, 02 Aug 2018 21:42:05 +0000
Subject: Re: [PATCH] drivers: net: lmc: fix case value for target abort error
Message-Id: <20180802.144205.1530942065351147301.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180801172241.1974-1-colin.king@canonical.com>
In-Reply-To: <20180801172241.1974-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: gomonovych@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 Aug 2018 18:22:41 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Current value for a target abort error is 0x010, however, this value
> should in fact be 0x002.  As it stands, the range of error is 0..7 so
> it is currently never being detected.  This bug has been in the driver
> since the early 2.6.12 days (or before).
> 
> Detected by CoverityScan, CID#744290 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
