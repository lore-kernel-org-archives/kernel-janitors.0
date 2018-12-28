From: Michal Hocko <mhocko@kernel.org>
Date: Fri, 28 Dec 2018 08:58:04 +0000
Subject: Re: [PATCH -next] mm: Mark 'stack_vm_area' with __maybe_unused
Message-Id: <20181228085804.GR16738@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545965190-2381-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545965190-2381-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, David Windsor <dave@nullcore.net>, Roman Gushchin <guro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri 28-12-18 02:46:30, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning when
> CONFIG_VMAP_STACK is not set:

Isn't this warning disabled? I can see the following
# These warnings generated too much noise in a regular build.
# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
KBUILD_CFLAGS += -Wno-unused-but-set-variable

in the main makefile. IMHO this warning doesn't really give us much.

> 
> kernel/fork.c: In function 'dup_task_struct':
> kernel/fork.c:843:20: warning:
>  variable 'stack_vm_area' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index e2a5156..b38c392 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -840,7 +840,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>  {
>  	struct task_struct *tsk;
>  	unsigned long *stack;
> -	struct vm_struct *stack_vm_area;
> +	struct vm_struct *stack_vm_area __maybe_unused;
>  	int err;
>  
>  	if (node = NUMA_NO_NODE)
> 
> 
> 

-- 
Michal Hocko
SUSE Labs
