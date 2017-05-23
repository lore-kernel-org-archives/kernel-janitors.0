From: Joe Perches <joe@perches.com>
Date: Tue, 23 May 2017 16:39:37 +0000
Subject: Re: tipc: Delete error messages for failed memory allocations in three functions
Message-Id: <1495557577.2093.66.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ac9d513-6f9f-a096-e68f-81a722c2723c@users.sourceforge.net>
         <1495548133.2093.58.camel@perches.com>
         <d07d0b1f-0038-e91d-4748-ea3e6dfb93f0@users.sourceforge.net>
In-Reply-To: <d07d0b1f-0038-e91d-4748-ea3e6dfb93f0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-05-23 at 18:23 +0200, SF Markus Elfring wrote:
> > tipc_subseq_alloc does a kcalloc (memset to 0),
> > half of which is immediately overwritten.
> > 
> > In other words, don't just blindly remove stuff,
> > understand what it does and improve it.
> 
> Do you suggest another specific source code transformation pattern here?

For the somewhat hard-of-thinking,
something like krealloc would do nicely.

