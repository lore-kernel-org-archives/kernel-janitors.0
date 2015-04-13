From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Apr 2015 22:02:34 +0000
Subject: Re: TODO list
Message-Id: <20150413220234.GV16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714100136.GA3583@albatros>
In-Reply-To: <20100714100136.GA3583@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 13, 2015 at 02:46:53PM -0700, Ravi Kerur wrote:
> Team,
> 
> I will take up net/sched files and get a clean checkpatch run on them. I am working on a project which involves this piece of code and as part of learning the code I can clean-up the files. I ran checkpatch on some of them and I do see that it needs cleaning. For e.g.
> 
> #:~/git/kernels/staging$ perl scripts/checkpatch.pl -f net/sched/act_api.c
> WARNING: networking block comments don't use an empty /* line, use /* Comment...
> #41: FILE: net/sched/act_api.c:41:
> +	/*
> +	 * gen_estimator est_timer() might access p->tcfc_locki
> 
> CHECK: Comparison to NULL could be written "!nest"
> #95: FILE: net/sched/act_api.c:95:
> +			if (nest = NULL)
> ...
> [...]

No one cares about either of those things.  If it's a drivers/staging
patch then we would merge it, but if it's a patch to net/sched/act_api.c
they will probably just get annoyed with you.

regards,
dan carpenter

