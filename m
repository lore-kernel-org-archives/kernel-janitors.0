From: David Miller <davem@davemloft.net>
Date: Sun, 07 Mar 2010 23:28:10 +0000
Subject: Re: [patch] sock.c: potential null dereference
Message-Id: <20100307.152810.247228037.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306110445.GC4958@bicker>
In-Reply-To: <20100306110445.GC4958@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, eric.dumazet@gmail.com, jengelh@medozas.de, mingo@elte.hu, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 6 Mar 2010 14:04:45 +0300

> We test that "prot->rsk_prot" is non-null right before we dereference it
> on this line.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
