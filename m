From: Joel Becker <Joel.Becker@oracle.com>
Date: Thu, 28 Oct 2010 11:55:32 +0000
Subject: Re: [patch v2] configfs: documentation: remove unneeded check
Message-Id: <20101028115531.GG11937@mail.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027100735.GE6062@bicker>
 <20101027112207.GA17439@mail.oracle.com>
 <20101027145031.GG6062@bicker>
In-Reply-To: <20101027145031.GG6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 27, 2010 at 04:50:31PM +0200, Dan Carpenter wrote:
> If "p" is NULL then it will cause an oops when we pass it to
> simple_strtoul().  In this case "p" can not be NULL so I removed the
> check.  I also changed the check a little to make it more explicit that
> we are testing whether p points to the NUL char.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Joel Becker <joel.becker@oracle.com>

> ---
> V2: Added some parenthesis to make the precedence more clear.
> 
> diff --git a/Documentation/filesystems/configfs/configfs_example_explicit.c b/Documentation/filesystems/configfs/configfs_example_explicit.c
> index d428cc9..63ff248 100644
> --- a/Documentation/filesystems/configfs/configfs_example_explicit.c
> +++ b/Documentation/filesystems/configfs/configfs_example_explicit.c
> @@ -89,7 +89,7 @@ static ssize_t childless_storeme_write(struct childless *childless,
>  	char *p = (char *) page;
>  
>  	tmp = simple_strtoul(p, &p, 10);
> -	if (!p || (*p && (*p != '\n')))
> +	if ((*p != '\0') && (*p != '\n'))
>  		return -EINVAL;
>  
>  	if (tmp > INT_MAX)
> 

-- 

"Sometimes I think the surest sign intelligent
 life exists elsewhere in the universe is that
 none of it has tried to contact us."
                                -Calvin & Hobbes

Joel Becker
Senior Development Manager
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
