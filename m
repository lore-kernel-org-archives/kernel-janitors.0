From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:39:10 +0000
Subject: Re: [PATCH 24/43] drivers/net/ixgbe: fix sparse warning: Should it
Message-Id: <20090217.173910.117584785.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213822.24377.64757.stgit@vmbox.hanneseder.net>
	<Pine.WNT.4.64.0902152248180.31128@ppwaskie-MOBL2.amr.corp.intel.com>
In-Reply-To: <Pine.WNT.4.64.0902152248180.31128@ppwaskie-MOBL2.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.p.waskiewicz.jr@intel.com
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Waskiewicz Jr, Peter P" <peter.p.waskiewicz.jr@intel.com>
Date: Sun, 15 Feb 2009 22:48:51 -0800 (Pacific Standard Time)

> > Impact: Make symbol static.
> > 
> > Fix this sparse warning:
> >   drivers/net/ixgbe/ixgbe_82598.c:59:5: warning: symbol 'ixgbe_get_pcie_msix_count_82598' was not declared. Should it be static?
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> 
> Acked-by: Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>

Applied.
