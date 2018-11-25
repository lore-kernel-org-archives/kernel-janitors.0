From: David Miller <davem@davemloft.net>
Date: Sun, 25 Nov 2018 02:04:02 +0000
Subject: Re: [PATCH] net: bridge: check for a null p->dev before dereferencing it
Message-Id: <20181124.180402.645583819668180736.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181124121551.6942-1-colin.king@canonical.com>
        <85963d6a-3411-9461-67aa-42e1fd02e663@cumulusnetworks.com>
In-Reply-To: <85963d6a-3411-9461-67aa-42e1fd02e663@cumulusnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nikolay@cumulusnetworks.com
Cc: colin.king@canonical.com, roopa@cumulusnetworks.com, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Date: Sat, 24 Nov 2018 14:21:07 +0200

> I was contacted recently about this privately and this was my reply:
> "Checking new_nbp() and del_nbp() it should not be possible to reach that code
> with p->dev or p->br as NULL. The cap check code has always been there, I just
> shuffled the rest of the function to obtain rtnl lock and kept it as close to
> the original as possible, thus the checks remained.
> In order to avoid future reports like this I'll send a cleanup once net-next
> opens up.
> 
> My reasoning of why it shouldn't be possible:
> - On port add new_nbp() sets both p->dev and p->br before creating kobj/sysfs
> 
> - On port del (trickier) del_nbp() calls kobject_del() before call_rcu() to destroy
>   the port which in turn calls sysfs_remove_dir() which uses kernfs_remove() which
>   deactivates (shouldn't be able to open new files) and calls kernfs_drain() to drain
>   current open/mmaped files in the respective dir before continuing, thus making it
>   impossible to open a bridge port sysfs file with p->dev and p->br equal to NULL.
> "
> 
> So I think it's safe to remove those checks altogether. It'd be nice to get a second
> look over my reasoning as I might be missing something in sysfs/kernfs call path.

I did a once over your analysis and I agree, the checks should be safe to remove.
