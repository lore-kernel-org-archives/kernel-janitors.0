From: David Miller <davem@davemloft.net>
Date: Mon, 21 Apr 2008 21:44:28 +0000
Subject: Re: [PATCH] Remove unneeded and deprecated cli()/sti() calls.
Message-Id: <20080421.144428.146049729.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1208807350-10618-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1208807350-10618-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark.asselstine@windriver.com
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, asselsm@gmail.com, klaus.kudielka@ieee.org, linux-hams@vger.kernel.org

From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 21 Apr 2008 15:49:10 -0400

> These cli()/sti() calls are made in start_timer() and are therefor
> redundant since the register_lock is now used to protect register
> io from within scc_isr() and write_scc() (where all calls to
> start_timer() originate).
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

This looks good, applied, thanks Mark.
