From: David Miller <davem@davemloft.net>
Date: Fri, 24 Feb 2012 22:50:06 +0000
Subject: Re: [PATCH 2/2] enic: Silence Sparse Warning: "dubious: x | !y"
Message-Id: <20120224.175006.1161090053765926485.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330102654-2474-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330102654-2474-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: benve@cisco.com, roprabhu@cisco.com, neepatel@cisco.com, nistrive@cisco.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 24 Feb 2012 22:27:34 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Sparse is giving the following warning:
> "warning: dubious: x | !y"
> 
> "enic_are_pp_different" is static and expected to return true or false.
> Logical or is indended here. With logical or, in best case, execution will be
> faster because if leftmost operand is true then no need to check other operands.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

As others have explained, this code is intentional.  It's faster because
the resulting code has less branches and therefore less potential
branch mispredictions.
