From: David Sterba <dsterba@suse.cz>
Date: Mon, 14 Sep 2015 20:43:06 +0000
Subject: Re: [PATCH 06/39] Btrfs: drop null test before destroy functions
Message-Id: <20150914204306.GU8891@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Chris Mason <clm@fb.com>, sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 13, 2015 at 02:14:59PM +0200, Julia Lawall wrote:
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

Acked-by: David Sterba <dsterba@suse.com>
