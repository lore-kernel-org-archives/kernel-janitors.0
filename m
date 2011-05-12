From: Stephen Hemminger <shemminger@vyatta.com>
Date: Thu, 12 May 2011 00:28:14 +0000
Subject: Re: [PATCH net-next-2.6] net/bonding: adjust codingstyle for
Message-Id: <20110511172814.714e2f2a@nehalam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110511225208.GA18851@x61.tchesoft.com>
In-Reply-To: <20110511225208.GA18851@x61.tchesoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aquini@linux.com
Cc: Jay Vosburgh <fubar@us.ibm.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Wed, 11 May 2011 19:52:21 -0300
Rafael Aquini <aquini@linux.com> wrote:

> Howdy,
> 
> While I was studying what bond_3ad has under its hood, I realized its coding
> style did not follow all Documentation/CodingStyle recommendations. As a tiny
> collaboration I did some mods there, in an attempt to make that code stick as
> closely as possible with Kernel's coding style. Also, Nicolas Kaiser has kindly
> suggested some conditional simplifications integrated in this patch.
> Modifications:
>         * switched all comments from C99-style to C89-style;
>         * replaced MAC_ADDRESS_COMPARE macro for compare_ether_addr();
> 	* print info out on unexpected status checkings;
>         * simplify conditionals:
> 		(a || (!a && !b)) => (a || !b)
> 		(!(!a && b)) => (a || !b)
> 
> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
> Signed-off-by: Rafael Aquini <aquini@linux.com>

This should be split into three separate patches.

Always assume your change will break something for somebody and it will
be necessary for some later investigation to bisect out the cause.



-- 
