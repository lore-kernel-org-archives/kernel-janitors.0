From: Rafael Aquini <aquini@linux.com>
Date: Thu, 12 May 2011 00:48:41 +0000
Subject: Re: [PATCH net-next-2.6] net/bonding: adjust codingstyle for bond_3ad
Message-Id: <20110512004839.GB2435@x61.tchesoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110511225208.GA18851@x61.tchesoft.com>
 <20110511172814.714e2f2a@nehalam>
In-Reply-To: <20110511172814.714e2f2a@nehalam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Jay Vosburgh <fubar@us.ibm.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

Howdy Stephen,

On Wed, May 11, 2011 at 05:28:14PM -0700, Stephen Hemminger wrote:
> 
> This should be split into three separate patches.
> 
> Always assume your change will break something for somebody and it will
> be necessary for some later investigation to bisect out the cause.

I'd like to know what are your suggestios to split it.
1. patch for comments;
2. patch for simplification (Nicolas);
3. patch for other adjusts (macro replacement, uninitialized vars...)

Would this approach really be productive?

Thanks in advance.

Cheers!
-- 
Rafael Aquini <aquini@linux.com>
