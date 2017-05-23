From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 16:23:17 +0000
Subject: Re: tipc: Delete error messages for failed memory allocations in three functions
Message-Id: <d07d0b1f-0038-e91d-4748-ea3e6dfb93f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ac9d513-6f9f-a096-e68f-81a722c2723c@users.sourceforge.net>
 <1495548133.2093.58.camel@perches.com>
In-Reply-To: <1495548133.2093.58.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> tipc_subseq_alloc does a kcalloc (memset to 0),
> half of which is immediately overwritten.
> 
> In other words, don't just blindly remove stuff,
> understand what it does and improve it.

Do you suggest another specific source code transformation pattern here?

Regards,
Markus
