From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Apr 2020 13:07:38 +0000
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
Message-Id: <20200429130738.GQ2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429073053.83660-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Jeff Vander Stoep <jeffv@google.com>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the kvcalloc() error
> handling case instead of 0, as done elsewhere in this function.
> 

Please add a Fixes tag and Cc Kent.

Fixes: acdf52d97f82 ("selinux: convert to kvmalloc")


> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index a0b3dc152468..a51e051df2cc 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -2638,6 +2638,7 @@ int policydb_read(struct policydb *p, void *fp)
>  	if (rc)
>  		goto bad;
>  
> +	rc = -ENOMEM;
>  	p->type_attr_map_array = kvcalloc(p->p_types.nprim,
>  					  sizeof(*p->type_attr_map_array),
>  					  GFP_KERNEL);

There is another bug earlier in the function as well:

security/selinux/ss/policydb.c
  2537  
  2538          rc = next_entry(buf, fp, sizeof(u32));
  2539          if (rc)
  2540                  goto bad;
  2541          nel = le32_to_cpu(buf[0]);
  2542  
  2543          p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
  2544          if (!p->role_tr)
  2545                  goto bad;
                        ^^^^^^^^

  2546          for (i = 0; i < nel; i++) {
  2547                  rc = -ENOMEM;

This style of setting the error code seems very bug prone.

The Fixes tag for this one is:
Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")

Just put both tags in the commit message.

regards,
dan carpenter
