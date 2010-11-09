From: David Miller <davem@davemloft.net>
Date: Tue, 09 Nov 2010 17:26:30 +0000
Subject: Re: [PATCH 3/3] net: tipc: fix information leak to userland
Message-Id: <20101109.092630.260076036.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288545032-16481-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288545032-16481-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jon.maloy@ericsson.com, allan.stephens@windriver.com, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 31 Oct 2010 20:10:32 +0300

> Structure sockaddr_tipc is copied to userland with padding bytes after
> "id" field in union field "name" unitialized.  It leads to leaking of
> contents of kernel stack memory.  We have to initialize them to zero.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Applied.

Patches #1 and #2 were given feedback which I need you to integrate
and submit new patches based upon, thanks.
