From: David Sterba <dave@jikos.cz>
Date: Mon, 05 Nov 2012 15:39:02 +0000
Subject: Re: [PATCH 1/8] fs/btrfs: drop if around WARN_ON
Message-Id: <20121105153902.GK3102@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
 <1351974625-10282-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351974625-10282-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Chris Mason <chris.mason@fusionio.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 03, 2012 at 09:30:18PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Just use WARN_ON rather than an if containing only WARN_ON(1).
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> @@
> - if (e) WARN_ON(1);
> + WARN_ON(e);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Reviewed-by: David Sterba <dsterba@suse.cz>
