From: David Miller <davem@davemloft.net>
Date: Mon, 17 Sep 2018 14:58:25 +0000
Subject: Re: [PATCH] net: hp100: fix always-true check for link up state
Message-Id: <20180917.075825.1597877157605714597.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914163953.20734-1-colin.king@canonical.com>
In-Reply-To: <20180914163953.20734-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: perex@perex.cz, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 17:39:53 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The operation ~(p100_inb(VG_LAN_CFG_1) & HP100_LINK_UP) returns a value
> that is always non-zero and hence the wait for the link to drop always
> terminates prematurely.  Fix this by using a logical not operator instead
> of a bitwise complement.  This issue has been in the driver since
> pre-2.6.12-rc2.
> 
> Detected by CoverityScan, CID#114157 ("Logical vs. bitwise operator")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied and queued up for -stable.
