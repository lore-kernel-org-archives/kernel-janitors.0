From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Apr 2014 16:52:49 +0000
Subject: Re: [patch] [MIPS] Lasat: a couple off by one bugs in picvue_proc.c
Message-Id: <20140402165249.GL18506@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108094431.GC27977@elgon.mountain>
In-Reply-To: <20131108094431.GC27977@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org

These off by one bugs are still there in linux-next.

regards,
dan carpenter

On Fri, Nov 08, 2013 at 12:44:31PM +0300, Dan Carpenter wrote:
> These should be ">=" instead of ">" or we go past the end of the
> pvc_lines[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/mips/lasat/picvue_proc.c b/arch/mips/lasat/picvue_proc.c
> index 638c5db..8c55de4 100644
> --- a/arch/mips/lasat/picvue_proc.c
> +++ b/arch/mips/lasat/picvue_proc.c
> @@ -44,7 +44,7 @@ static int pvc_line_proc_show(struct seq_file *m, void *v)
>  {
>  	int lineno = *(int *)m->private;
>  
> -	if (lineno < 0 || lineno > PVC_NLINES) {
> +	if (lineno < 0 || lineno >= PVC_NLINES) {
>  		printk(KERN_WARNING "proc_read_line: invalid lineno %d\n", lineno);
>  		return 0;
>  	}
> @@ -68,7 +68,7 @@ static ssize_t pvc_line_proc_write(struct file *file, const char __user *buf,
>  	char kbuf[PVC_LINELEN];
>  	size_t len;
>  
> -	BUG_ON(lineno < 0 || lineno > PVC_NLINES);
> +	BUG_ON(lineno < 0 || lineno >= PVC_NLINES);
>  
>  	len = min(count, sizeof(kbuf) - 1);
>  	if (copy_from_user(kbuf, buf, len))
