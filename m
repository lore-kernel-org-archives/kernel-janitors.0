From: "Waskiewicz Jr, Peter P" <peter.p.waskiewicz.jr@intel.com>
Date: Mon, 16 Feb 2009 06:48:51 +0000
Subject: Re: [PATCH 24/43] drivers/net/ixgbe: fix sparse warning: Should it
Message-Id: <Pine.WNT.4.64.0902152248180.31128@ppwaskie-MOBL2.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
 <20090214213822.24377.64757.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213822.24377.64757.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Impact: Make symbol static.
> 
> Fix this sparse warning:
>   drivers/net/ixgbe/ixgbe_82598.c:59:5: warning: symbol 'ixgbe_get_pcie_msix_count_82598' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Acked-by: Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>
