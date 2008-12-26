From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 02:05:46 +0000
Subject: Re: [PATCH 13/13] net/appletalk: Remove redundant test
Message-Id: <20081225.180546.25884866.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211641590.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211641590.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: acme@ghostprotocols.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 16:42:18 +0100 (CET)

> atif is tested for being NULL twice, with the same effect in each case.  I
> have kept the second test, as it seems to fit well with the comment above it.

Applied.

But please always CC: netdev on all networking patches, so that your
patch gets properly tracked at:

	http://patchwork.ozlabs.org/project/netdev/list/

I only caught this one by accident while scanning linux-kernel
postings.  Depending upon that kind of luck is not a good idea :)
