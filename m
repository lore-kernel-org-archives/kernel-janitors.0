From: David Miller <davem@davemloft.net>
Date: Wed, 10 Nov 2010 18:14:49 +0000
Subject: Re: [PATCH v2] net: ax25: fix information leak to userland
Message-Id: <20101110.101449.104041941.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289412757-11411-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289412757-11411-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 10 Nov 2010 21:12:36 +0300

> Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
> field of fsa struct, also the struct has padding bytes between
> sax25_call and sax25_ndigis fields.  This structure is then copied to
> userland.  It leads to leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Looks good to me, applied.

Thanks!
