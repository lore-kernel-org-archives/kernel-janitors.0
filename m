From: bfields@fieldses.org (J. Bruce Fields)
Date: Wed, 14 Jun 2017 20:34:14 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <20170614203414.GC32208@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain>
In-Reply-To: <20170614093002.GG29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, NeilBrown <neilb@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 12:30:02PM +0300, Dan Carpenter wrote:
> I found this bug by reviewing places where we do ERR_PTR(0) (which is
> NULL).
> 
> We used to return an error pointer if lookup_one_len() failed but we
> moved this code into a helper function and accidentally removed that.
> NULL is a valid return for this function but it's not what we intended.
> 
> Fixes: bbf7a8a3562f ("exportfs: move most of reconnect_path to helper function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

ACK.  Agreed that the current code is wrong, and that this is the
correct fix.

What I don't quite understand yet is what the impact of the bug would
be.

--b.

> 
> diff --git a/fs/exportfs/expfs.c b/fs/exportfs/expfs.c
> index 329a5d103846..451237745689 100644
> --- a/fs/exportfs/expfs.c
> +++ b/fs/exportfs/expfs.c
> @@ -147,6 +147,7 @@ static struct dentry *reconnect_one(struct vfsmount *mnt,
>  	tmp = lookup_one_len_unlocked(nbuf, parent, strlen(nbuf));
>  	if (IS_ERR(tmp)) {
>  		dprintk("%s: lookup failed: %d\n", __func__, PTR_ERR(tmp));
> +		err = PTR_ERR(tmp);
>  		goto out_err;
>  	}
>  	if (tmp != dentry) {
