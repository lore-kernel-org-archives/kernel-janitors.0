From: Ben Hutchings <bhutchings@solarflare.com>
Date: Tue, 31 May 2011 01:10:22 +0000
Subject: Re: [PATCH] bond_3ad.c: switch MAC_ADDRESS_COMPARE macro for
Message-Id: <1306804222.4277.66.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110531004418.GA22937@optiplex.tchesoft.com>
In-Reply-To: <20110531004418.GA22937@optiplex.tchesoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aquini@linux.com
Cc: kernel-janitors@vger.kernel.org, Jay Vosburgh <fubar@us.ibm.com>, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org

On Mon, 2011-05-30 at 21:44 -0300, Rafael Aquini wrote:
> Converts all uses of MAC_ADDRESS_COMPARE macro to compare_ether_addr() and delete the macro.
[...]

Given all the casts you have to add, this doesn't seem like an
improvement.

How about replacing struct mac_addr with u8[ETH_ALEN] at the same time?
You should also be able to get rid of null_mac_addr and use
is_zero_ether_addr() instead.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.

