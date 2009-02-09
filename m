From: David Miller <davem@davemloft.net>
Date: Mon, 09 Feb 2009 01:01:34 +0000
Subject: Re: [PATCH 3/6] drivers/isdn: introduce missing kfree
Message-Id: <20090208.170134.255617349.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082244180.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082244180.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kkeil@suse.de, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 8 Feb 2009 22:44:47 +0100 (CET)

> Error handling code following a kmalloc should free the allocated data.
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Also applied.

Please CC: ISDN patches to netdev as it is networking, and so
that the patch gets properly tracked at:

	http://patchwork.ozlabs.org/project/netdev/list/

and therefore is less likely to be lost.

Thank you.
