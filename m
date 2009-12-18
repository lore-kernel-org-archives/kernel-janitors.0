From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:26:51 +0000
Subject: Re: [PATCH 4/4] fs/qnx4: decrement sizeof size in strncmp
Message-Id: <alpine.LNX.2.00.0912181526160.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091112220836.GA3893@alarsen.net>
In-Reply-To: <20091112220836.GA3893@alarsen.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Larsen <al@alarsen.net>
Cc: Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, 12 Nov 2009, Anders Larsen wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> As an identical match is wanted in this case, strcmp can be used instead.
> 
> The semantic match that lead to detecting this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression foo;
> constant char *abc;
> @@
> 
> *strncmp(foo, abc, sizeof(abc))
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> Signed-off-by: Anders Larsen <al@alarsen.net>
> 
> ---
>  fs/qnx4/inode.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
> index 449f5a6..150f4af 100644
> --- a/fs/qnx4/inode.c
> +++ b/fs/qnx4/inode.c
> @@ -221,7 +221,8 @@ static const char *qnx4_checkroot(struct super_block *sb)
>  				rootdir = (struct qnx4_inode_entry *) (bh->b_data + i * QNX4_DIR_ENTRY_SIZE);
>  				if (rootdir->di_fname != NULL) {
>  					QNX4DEBUG((KERN_INFO "rootdir entry found : [%s]\n", rootdir->di_fname));
> -					if (!strncmp(rootdir->di_fname, QNX4_BMNAME, sizeof QNX4_BMNAME)) {
> +					if (!strcmp(rootdir->di_fname,
> +						    QNX4_BMNAME)) {
>  						found = 1;
>  						qnx4_sb(sb)->BitMap = kmalloc( sizeof( struct qnx4_inode_entry ), GFP_KERNEL );
>  						if (!qnx4_sb(sb)->BitMap) {

Doesn't seem to be present in 2.6.33-rc1.

Applied to my queue, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
