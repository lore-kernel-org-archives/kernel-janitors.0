From: Richard Weinberger <richard@nod.at>
Date: Tue, 18 Oct 2016 21:02:49 +0000
Subject: Re: [PATCH] um: remove hppfs MAINTAINERS entry
Message-Id: <bc7d3a05-4a82-7ded-248e-1a7725f1d2b7@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161011055000.GA6961@mwanda>
In-Reply-To: <20161011055000.GA6961@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11.10.2016 07:50, Dan Carpenter wrote:
> We removed hppfs in commit f74a14e870c8 ('um: Remove hppfs') so we can
> remove the MAINTAINERS entry as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63f15c9..116729a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12671,7 +12671,6 @@ F:	Documentation/virtual/uml/
>  F:	arch/um/
>  F:	arch/x86/um/
>  F:	fs/hostfs/
> -F:	fs/hppfs/
>  
>  USERSPACE I/O (UIO)
>  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
