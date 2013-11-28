From: Oleg Nesterov <oleg@redhat.com>
Date: Thu, 28 Nov 2013 11:28:32 +0000
Subject: Re: [PATCH] kernel/fork.c : remove redundant NULL check in dup_mm()
Message-Id: <20131128112832.GA3343@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1457075.dfc7RuZcNt@daeseok-laptop>
In-Reply-To: <1457075.dfc7RuZcNt@daeseok-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/28, Daeseok Youn wrote:
>
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -804,9 +804,6 @@ struct mm_struct *dup_mm(struct task_struct *tsk)
>  	struct mm_struct *mm, *oldmm = current->mm;
>  	int err;
>  
> -	if (!oldmm)
> -		return NULL;
> -
>  	mm = allocate_mm();
>  	if (!mm)
>  		goto fail_nomem;

Acked-by: Oleg Nesterov <oleg@redhat.com>

