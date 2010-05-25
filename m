From: ebiederm@xmission.com (Eric W. Biederman)
Date: Tue, 25 May 2010 10:25:37 +0000
Subject: Re: [patch] kobject: free memory if netlink_kernel_create() fails
Message-Id: <m1d3wk2s7y.fsf@fess.ebiederm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525095110.GG22515@bicker>
In-Reply-To: <20100525095110.GG22515@bicker> (Dan Carpenter's message of "Tue\, 25 May 2010 11\:51\:10 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> writes:

> There is a kfree(ue_sk) missing on the error path if 
> netlink_kernel_create() fails.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

Oops.

> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index 59c1551..08e15f7 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -378,6 +378,7 @@ static int uevent_net_init(struct net *net)
>  	if (!ue_sk->sk) {
>  		printk(KERN_ERR
>  		       "kobject_uevent: unable to create netlink socket!\n");
> +		kfree(ue_sk);
>  		return -ENODEV;
>  	}
>  	mutex_lock(&uevent_sock_mutex);
