From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 10 Nov 2010 15:54:26 +0000
Subject: Re: [PATCH 3/3] net: tipc: fix information leak to userland
Message-Id: <20101110155426.GA6484@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288545032-16481-1-git-send-email-segooon@gmail.com>
 <20101109.092630.260076036.davem@davemloft.net>
 <20101109203317.GA24933@albatros>
 <4CDA88FE.8040801@bfs.de>
In-Reply-To: <4CDA88FE.8040801@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: David Miller <davem@davemloft.net>, kernel-janitors@vger.kernel.org, jon.maloy@ericsson.com, allan.stephens@windriver.com, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 10, 2010 at 12:58 +0100, walter harms wrote:
> NTL the core problem was that sizeof sa_data is 14 while dev->name is IFNAMESZ.

With this code it is NOT a bug because the output buffer is much bigger
than 14 (128 bytes).  I think it was just designed to overflow 14 bytes,
assign sa_data[14] = 0 and ignore it (lack of snprintf() those days?).

Anywhere else sa_data[14] = ... is a bug.

-- 
Vasiliy
