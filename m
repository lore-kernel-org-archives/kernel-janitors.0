From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 29 Sep 2015 13:02:09 +0000
Subject: Re: [PATCH 08/39] pktcdvd: drop null test before destroy functions
Message-Id: <alpine.LNX.2.00.1509291501560.30132@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr> <1442146532-9100-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 13 Sep 2015, Julia Lawall wrote:

> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

