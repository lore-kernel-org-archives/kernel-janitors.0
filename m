From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 23 Feb 2017 16:42:26 +0000
Subject: Re: [patch] ceph: tidy some white space in get_nonsnap_parent()
Message-Id: <CAOi1vP9V8F3z9AAO=-wMKVRKs8LDMLEBn3QM216S=iaVtKehkw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170223103852.GA27418@mwanda>
In-Reply-To: <20170223103852.GA27418@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Yan, Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>, Ceph Development <ceph-devel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Feb 23, 2017 at 11:39 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The white space here seems slightly messed up.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index fdbc3544e41c..c681762d76e6 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -679,8 +679,9 @@ static void __unregister_request(struct ceph_mds_client *mdsc,
>   * working with them. Once we hit a candidate dentry, we attempt to take a
>   * reference to it, and return that as the result.
>   */
> -static struct inode *get_nonsnap_parent(struct dentry *dentry) { struct inode
> -       *inode = NULL;
> +static struct inode *get_nonsnap_parent(struct dentry *dentry)
> +{
> +       struct inode *inode = NULL;
>
>         while (dentry && !IS_ROOT(dentry)) {
>                 inode = d_inode_rcu(dentry);

Applied.

Thanks,

                Ilya
