From: Chuck Lever <chuck.lever@oracle.com>
Date: Fri, 01 Nov 2019 13:36:27 +0000
Subject: Re: [PATCH -next] nfsd: Drop LIST_HEAD where the variable it declares is never used.
Message-Id: <7E1B5E17-FF35-472B-8316-D4C01085BAE4@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101114054.50225-1-maowenan@huawei.com>
In-Reply-To: <20191101114054.50225-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Bruce Fields <bfields@redhat.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Dros Adamson <dros@primarydata.com>, jeff.layton@primarydata.com, richard.sharpe@primarydata.com, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Mao-

> On Nov 1, 2019, at 7:40 AM, Mao Wenan <maowenan@huawei.com> wrote:
> 
> The declarations were introduced with the file, but the declared
> variables were not used.
> 
> Fixes: 65294c1f2c5e ("nfsd: add a new struct file caching facility to nfsd")

I'm not sure a Fixes: tag is necessary here? 65294c1f2c5e
works fine without this change, and it's not something we
would need to backport into stable kernels.

This is more of a clean up patch.


> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
> fs/nfsd/filecache.c | 2 --
> 1 file changed, 2 deletions(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index ef55e9b..32a9bf2 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -685,8 +685,6 @@ nfsd_file_cache_purge(struct net *net)
> void
> nfsd_file_cache_shutdown(void)
> {
> -	LIST_HEAD(dispose);
> -
> 	set_bit(NFSD_FILE_SHUTDOWN, &nfsd_file_lru_flags);
> 
> 	lease_unregister_notifier(&nfsd_file_lease_notifier);
> -- 
> 2.7.4
> 

--
Chuck Lever
