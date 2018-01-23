From: Geoff Levand <geoff@infradead.org>
Date: Tue, 23 Jan 2018 18:25:28 +0000
Subject: Re: [PATCH] powerpc/ps3: remove an unneeded NULL check
Message-Id: <61ad7fd7-6bb6-6b29-0053-5dfc3c96469b@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123083318.GB10091@mwanda>
In-Reply-To: <20180123083318.GB10091@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 01/23/2018 12:33 AM, Dan Carpenter wrote:
> @@ -43,7 +43,7 @@ void ps3_sys_manager_register_ops(const struct ps3_sys_manager_ops *ops)
>  {
>  	BUG_ON(!ops);
>  	BUG_ON(!ops->dev);
> -	ps3_sys_manager_ops = ops ? *ops : ps3_sys_manager_ops;
> +	ps3_sys_manager_ops = *ops;

This seems to be a left over from when I was adding the modular
system-manager support.  It doesn't really make sense if you
look at how the ps3_sys_manager_ops variable is used.

I added your patch to my ps3-queue branch.  Thanks for the
contribution.

-Geoff
