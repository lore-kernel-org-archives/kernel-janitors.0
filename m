From: Joel Becker <Joel.Becker@oracle.com>
Date: Wed, 27 Oct 2010 11:22:08 +0000
Subject: Re: [patch] configfs: documentation: remove unneeded check
Message-Id: <20101027112207.GA17439@mail.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027100735.GE6062@bicker>
In-Reply-To: <20101027100735.GE6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 27, 2010 at 12:07:35PM +0200, Dan Carpenter wrote:
> If "p" is NULL then it will cause an oops when we pass it to
> simple_strtoul().  In this case "p" can not be NULL so I removed the
> check and cleaned up the rest of the if condition as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
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
> +	if (*p != '\0' && *p != '\n')
>  		return -EINVAL;

	If you're going to prefer "*p != '\0'" to "*p" as a test, I'd
like you to include parens: "if ((*p != '\0') && (*p != '\n'))"  While
the order of precedence is correct in your change, it makes folks have
to stop and think about order of precedence in the first place.

Joel

-- 

Life's Little Instruction Book #444

	"Never underestimate the power of a kind word or deed."

Joel Becker
Senior Development Manager
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
