From: David Miller <davem@davemloft.net>
Date: Sun, 08 Aug 2010 06:04:28 +0000
Subject: Re: [patch] isdn: gigaset: add missing unlock
Message-Id: <20100807.230428.216772079.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806082323.GU9031@bicker>
In-Reply-To: <20100806082323.GU9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: hjlipp@web.de, tilman@imap.cc, isdn@linux-pingi.de, ext-andriy.shevchenko@nokia.com, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 6 Aug 2010 10:23:23 +0200

> We should unlock here.  This is the only place where we return from the
> function with the lock held.  The caller isn't expecting it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
