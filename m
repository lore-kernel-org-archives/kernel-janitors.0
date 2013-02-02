From: Theodore Ts'o <tytso@mit.edu>
Date: Sat, 02 Feb 2013 01:07:37 +0000
Subject: Re: [PATCH 9/16] fs/ext4/indirect.c: use WARN
Message-Id: <20130202010737.GA9892@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
 <1351940317-14812-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 03, 2012 at 11:58:30AM +0100, Julia Lawall wrote:
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

Thanks, applied.

					- Ted
