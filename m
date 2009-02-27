From: David Miller <davem@davemloft.net>
Date: Fri, 27 Feb 2009 09:01:29 +0000
Subject: Re: [PATCH 0/5] drivers/isdn: fix sparse warnings
Message-Id: <20090227.010129.221180189.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225230737.5377.31370.stgit@localhost.localdomain>
In-Reply-To: <20090225230737.5377.31370.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 26 Feb 2009 00:08:20 +0100

> The following series fixes some sparse warnings in drivers/isdn.
> 
> ---
> 
> Hannes Eder (5):
>       drivers/isdn/hardware/eicon: fix sparse warnings: Should it be static?
>       drivers/isdn/hardware/icon: fix sparse warning: cast truncates bits
>       drivers/isdn/hisax: fix sparse warning: Should it be static?
>       drivers/isdn/act2000: fix sparse warning: symbol shadows an earlier one
>       drivers/isdn/capi: fix sparse warning: context imbalance

Applied to net-next-2.6, thanks!
