From: David Miller <davem@davemloft.net>
Date: Fri, 27 Feb 2009 07:13:53 +0000
Subject: Re: [PATCH 0/8] net: fix (sparse) warnings
Message-Id: <20090226.231353.238232825.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 21:31:10 +0100

> The following series fixes some (sparse) warnings in net/.
> 
> ---
> 
> Hannes Eder (8):
>       wanrouter: fix sparse warnings: context imbalance
>       inet fragments: fix sparse warning: context imbalance
>       decnet: fix sparse warnings: symbol shadows an earlier one
>       decnet: fix sparse warnings: context imbalance
>       [NET] sysctl: fix sparse warning: Should it be static?
>       appletalk: fix warning: format not a string literal and no ...
>       9p: fix sparse warning: cast adds address space
>       net/802: fix sparse warnings: context imbalance

All applied to net-next-2.6, thanks!
