From: Chuck Lever <chuck.lever@oracle.com>
Date: Mon, 03 Jan 2011 15:59:36 +0000
Subject: Re: [patch -next] lockd: double unlock in next_host_state()
Message-Id: <001458D4-F513-4959-9BE7-476F8542D009@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110102202042.GN1886@bicker>
In-Reply-To: <20110102202042.GN1886@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org


On Jan 2, 2011, at 3:20 PM, Dan Carpenter wrote:

> We unlock again after we goto out.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/lockd/host.c b/fs/lockd/host.c
> index c106d6a..5f1bcb2 100644
> --- a/fs/lockd/host.c
> +++ b/fs/lockd/host.c
> @@ -532,7 +532,6 @@ static struct nlm_host *next_host_state(struct hlist_head *cache,
> 			host->h_state++;
> 
> 			nlm_get_host(host);
> -			mutex_unlock(&nlm_host_mutex);
> 			goto out;
> 		}
> 	}

Would it also make sense to replace the "goto out;" with a "break;" ?

-- 
Chuck Lever
chuck[dot]lever[at]oracle[dot]com




