From: ebiederm@xmission.com (Eric W. Biederman)
Date: Wed, 14 Aug 2013 19:35:24 +0000
Subject: Re: [patch] rtnetlink: remove an unneeded test
Message-Id: <8761v8aww3.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814093542.GC521@elgon.mountain>
In-Reply-To: <20130814093542.GC521@elgon.mountain> (Dan Carpenter's message of
	"Wed, 14 Aug 2013 12:35:42 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, John Fastabend <john.r.fastabend@intel.com>, Jiri Pirko <jiri@resnulli.us>, Vlad Yasevich <vyasevic@redhat.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We know that "dev" is a valid pointer at this point, so we can remove
> the test and clean up a little.

Quite right.

Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 618dbe4..e7e058e 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -1867,10 +1867,10 @@ replay:
>  		else
>  			err = register_netdevice(dev);
>  
> -		if (err < 0 && !IS_ERR(dev))
> +		if (err < 0) {
>  			free_netdev(dev);
> -		if (err < 0)
>  			goto out;
> +		}
>  
>  		err = rtnl_configure_link(dev, ifm);
>  		if (err < 0)
