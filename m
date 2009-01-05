From: Steven Whitehouse <swhiteho@redhat.com>
Date: Mon, 05 Jan 2009 09:25:10 +0000
Subject: Re: [PATCH 7/7] fs/gfs2: Use DEFINE_SPINLOCK
Message-Id: <1231147510.9571.457.camel@quoit>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812251535080.22039@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812251535080.22039@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

Now added to the GFS2 -nmw git tree. Thanks,

Steve.

On Thu, 2008-12-25 at 15:35 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
> in Documentation/spinlocks.txt
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> declarer name DEFINE_SPINLOCK;
> identifier xxx_lock;
> @@
> 
> - spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
> + DEFINE_SPINLOCK(xxx_lock);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> diff -u -p a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -65,7 +65,7 @@ static struct dentry *gfs2_root;
>  static struct workqueue_struct *glock_workqueue;
>  static LIST_HEAD(lru_list);
>  static atomic_t lru_count = ATOMIC_INIT(0);
> -static spinlock_t lru_lock = SPIN_LOCK_UNLOCKED;
> +static DEFINE_SPINLOCK(lru_lock);
>  
>  #define GFS2_GL_HASH_SHIFT      15
>  #define GFS2_GL_HASH_SIZE       (1 << GFS2_GL_HASH_SHIFT)

