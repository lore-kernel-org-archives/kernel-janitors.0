From: Vladimir Davydov <vdavydov@parallels.com>
Date: Mon, 27 Oct 2014 15:08:47 +0000
Subject: Re: [patch] cpuset: lock vs unlock typo
Message-Id: <20141027150847.GE17258@esperanza>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141027132702.GA32133@mwanda>
In-Reply-To: <20141027132702.GA32133@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 27, 2014 at 04:27:02PM +0300, Dan Carpenter wrote:
> This will deadlock instead of unlocking.
> 
> Fixes: f73eae8d8384 ('cpuset: simplify cpuset_node_allowed API')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Shame on me. It strikes only if cgroup.clone_children is set, so I
didn't catch it while testing the patch :-(

Acked-by: Vladimir Davydov <vdavydov@parallels.com>

Thank you!

> 
> diff --git a/kernel/cpuset.c b/kernel/cpuset.c
> index 38f7433..4eaa203 100644
> --- a/kernel/cpuset.c
> +++ b/kernel/cpuset.c
> @@ -1992,7 +1992,7 @@ static int cpuset_css_online(struct cgroup_subsys_state *css)
>  	spin_lock_irq(&callback_lock);
>  	cs->mems_allowed = parent->mems_allowed;
>  	cpumask_copy(cs->cpus_allowed, parent->cpus_allowed);
> -	spin_lock_irq(&callback_lock);
> +	spin_unlock_irq(&callback_lock);
>  out_unlock:
>  	mutex_unlock(&cpuset_mutex);
>  	return 0;
