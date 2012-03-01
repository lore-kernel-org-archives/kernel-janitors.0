From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 01 Mar 2012 12:30:04 +0000
Subject: Re: [PATCH 2/3] netfilter: potential null derefence.
Message-Id: <20120301123004.GA7250@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: bart.de.schuymer@pandora.be, kaber@trash.net, shemminger@vyatta.com, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 01, 2012 at 02:47:14PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> I am getting following error.
> " net/bridge/netfilter/ebtables.c:269 ebt_do_table()
>   error: potential null derefence 'cs'"
> 
>     i = cs[sp].n;  // If cs = Null then this will cause problem.

Very sorry, I didn't see the out label.

I'll apply this to my nf [1] once David takes my previous request for
pulling.

[1] http://1984.lsi.us.es/git/net
