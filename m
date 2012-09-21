From: David Miller <davem@davemloft.net>
Date: Fri, 21 Sep 2012 16:24:18 +0000
Subject: Re: [can:master 118/170] ERROR: "sysctl_llc_station_ack_timeout" [net/llc/llc2.ko] undefined!
Message-Id: <20120921.122418.1595502576924307596.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921112740.GA15164@localhost>
In-Reply-To: <20120921112740.GA15164@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fengguang.wu@intel.com
Cc: ben@decadent.org.uk, kernel-janitors@vger.kernel.org, linux-can@vger.kernel.org

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 19:27:40 +0800

> Hi Ben,
> 
> FYI, kernel build failed on
> 
> tree:   git://gitorious.org/linux-can/linux-can-next master
> head:   029d8ada9150a1177f09148284b5cd27a30d4db7
> commit: 025e36332573177ecd7c12730e18a4390f994f05 [118/170] llc2: Remove dead code for state machine
> config: x86_64-allmodconfig
> 
> All related error/warning messages:
> 
> ERROR: "sysctl_llc_station_ack_timeout" [net/llc/llc2.ko] undefined!

The very next commit, written by me, after Ben's fixes this build
error.

It wasn't added by the CAN tree so bugging them is very inappropriate,
the change came from the net-next tree.
