From: Fengguang Wu <wfg@linux.intel.com>
Date: Wed, 11 Jul 2012 09:44:50 +0000
Subject: Re: [net-next:master 73/84] net/ipv4/tcp_metrics.c:252:3: error: implicit declaration of function 'i
Message-Id: <20120711094450.GA24721@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711091233.GA24436@localhost>
 <20120711.023939.1269322960321058056.davem@davemloft.net>
In-Reply-To: <20120711.023939.1269322960321058056.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 11, 2012 at 02:39:39AM -0700, David Miller wrote:
> From: wfg@linux.intel.com
> Date: Wed, 11 Jul 2012 17:12:33 +0800
> 
> > net/ipv4/tcp_metrics.c: In function '__tcp_get_metrics_tw':
> > net/ipv4/tcp_metrics.c:252:3: error: implicit declaration of function 'inet6_twsk' [-Werror=implicit-function-declaration]
> > net/ipv4/tcp_metrics.c:252:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> > net/ipv4/tcp_metrics.c:253:41: error: dereferencing pointer to incomplete type
> 
> Fixed as follows:
> 
> ==========
> ipv6: Move ipv6 twsk accessors outside of CONFIG_IPV6 ifdefs.
> 
> Fixes build when ipv6 is disabled.
> 
> Reported-by: Fengguang Wu <wfg@linux.intel.com>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> ---
>  include/linux/ipv6.h |   32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)

It worked, thanks!

Fengguang
