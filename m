From: David Sterba <dave@jikos.cz>
Date: Mon, 05 Nov 2012 15:38:35 +0000
Subject: Re: [PATCH 13/16] fs/btrfs: use WARN
Message-Id: <20121105153835.GJ3102@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
 <1351940317-14812-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-14-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Chris Mason <chris.mason@fusionio.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 03, 2012 at 11:58:34AM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN rather than printk followed by WARN_ON(1), for conciseness.
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression list es;
> @@
> 
> -printk(
> +WARN(1,
>   es);
> -WARN_ON(1);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Reviewed-by: David Sterba <dsterba@suse.cz>
