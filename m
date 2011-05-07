From: Joe Perches <joe@perches.com>
Date: Sat, 07 May 2011 01:51:40 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <1304733100.11874.33.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110507012717.GA15854@x61.tchesoft.com>
In-Reply-To: <20110507012717.GA15854@x61.tchesoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aquini@linux.com
Cc: kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Jay Vosburgh <fubar@us.ibm.com>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Fri, 2011-05-06 at 22:27 -0300, Rafael Aquini wrote:
> @@ -411,36 +406,32 @@ static inline void __initialize_port_locks(struct port *port)
>   */
>  static u16 __ad_timer_to_ticks(u16 timer_type, u16 par)
>  {
> -	u16 retval = 0; /* to silence the compiler */
> +	u16 retval = 0;

I think it's not good to remove this sort of comment.
(there are others like it)

Another option might be to add __maybe_unused


