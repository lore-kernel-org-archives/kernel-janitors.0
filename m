From: David Miller <davem@davemloft.net>
Date: Sat, 12 Jun 2010 01:37:53 +0000
Subject: Re: [patch] enic: cleanup vic_provinfo_alloc()
Message-Id: <20100611.183753.13760714.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075903.GL5483@bicker>
In-Reply-To: <20100610075903.GL5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: scofeldm@cisco.com, vkolluri@cisco.com, roprabhu@cisco.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 10 Jun 2010 09:59:03 +0200

> If oui were a null variable then vic_provinfo_alloc() would leak memory.
> But this function is only called from one place and oui is not null so 
> I removed the check.
> 
> I also moved the memory allocation down a line so it was easier to spot.
> (No one ever reads variable declarations).
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to net-next-2.6, thanks.
