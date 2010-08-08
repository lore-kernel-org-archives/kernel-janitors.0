From: David Miller <davem@davemloft.net>
Date: Sun, 08 Aug 2010 06:04:23 +0000
Subject: Re: [patch] isdn: gigaset: use after free
Message-Id: <20100807.230423.209957640.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806082126.GT9031@bicker>
In-Reply-To: <20100806082126.GT9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: hjlipp@web.de, tilman@imap.cc, isdn@linux-pingi.de, tj@kernel.org, joe@perches.com, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 6 Aug 2010 10:21:26 +0200

> I moved the kfree(cb) below the dereferences.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
