From: ebiederm@xmission.com (Eric W. Biederman)
Date: Mon, 28 Mar 2011 11:55:31 +0000
Subject: Re: [patch -next] ipcns: use after free in free_ipc_ns()
Message-Id: <m1vcz3zcgc.fsf@fess.ebiederm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110328085048.GI1885@bicker>
In-Reply-To: <20110328085048.GI1885@bicker> (Dan Carpenter's message of "Mon,
	28 Mar 2011 11:50:48 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, serge@hallyn.com, David Howells <dhowells@redhat.com>, Daniel Lezcano <daniel.lezcano@free.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> writes:

> We dereference "ns" after it has been freed.  This was introduced in
> b515498f5bb5 "userns: add a user namespace owner of ipc ns".

I think Andrew has already merged this fix.


>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/ipc/namespace.c b/ipc/namespace.c
> index 3c3e522..8054c8e 100644
> --- a/ipc/namespace.c
> +++ b/ipc/namespace.c
> @@ -104,7 +104,6 @@ static void free_ipc_ns(struct ipc_namespace *ns)
>  	sem_exit_ns(ns);
>  	msg_exit_ns(ns);
>  	shm_exit_ns(ns);
> -	kfree(ns);
>  	atomic_dec(&nr_ipc_ns);
>  
>  	/*
> @@ -113,6 +112,7 @@ static void free_ipc_ns(struct ipc_namespace *ns)
>  	 */
>  	ipcns_notify(IPCNS_REMOVED);
>  	put_user_ns(ns->user_ns);
> +	kfree(ns);
>  }
>  
>  /*
