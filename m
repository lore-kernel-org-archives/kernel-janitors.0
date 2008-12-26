From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 08:03:00 +0000
Subject: Re: [PATCH 11/27] drivers/net/igb: remove dead code (function
Message-Id: <20081226.000300.75987642.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191632.11807.3776.stgit@vmbox.hanneseder.net>
	<9929d2390812221430j1bc15607m58dd07a6ac8dec5@mail.gmail.com>
In-Reply-To: <9929d2390812221430j1bc15607m58dd07a6ac8dec5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeffrey.t.kirsher@intel.com
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Jeff Kirsher" <jeffrey.t.kirsher@intel.com>
Date: Mon, 22 Dec 2008 14:30:00 -0800

> On Mon, Dec 22, 2008 at 11:16 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> > Fix this warning:
> >
> >  drivers/net/igb/e1000_mac.c:54: warning: 'igb_read_pci_cfg' defined but not used
> >
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
 ...
> Acked-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

Applied.
