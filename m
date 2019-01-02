From: David Sterba <dsterba@suse.cz>
Date: Wed, 02 Jan 2019 16:40:48 +0000
Subject: Re: [PATCH 11/20] Btrfs: drop useless LIST_HEAD
Message-Id: <20190102164048.GZ23615@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <1545555435-24576-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Chris Mason <clm@fb.com>, kernel-janitors@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Dec 23, 2018 at 09:57:06AM +0100, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> The uses were removed in 3fd0a5585eb9 ("Btrfs: Metadata ENOSPC
> handling for balance"), but not the declaration.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier x;
> @@
> - LIST_HEAD(x);
>   ... when != x
> // </smpl>
> 
> Fixes: 3fd0a5585eb9 ("Btrfs: Metadata ENOSPC handling for balance")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Added to patch queue, thanks. I've dropepd the Fixes: line as it's not
really a fix that would need to go to stable. The original commit is
mentioned in the changelog which is IMHO sufficient.
