From: "Paul E. McKenney" <paulmck@kernel.org>
Date: Mon, 25 Jan 2021 16:58:12 +0000
Subject: Re: [PATCH] rcu-tasks: rectify kernel-doc for struct rcu_tasks
Message-Id: <20210125165812.GZ2743@paulmck-ThinkPad-P72>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125074105.29038-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210125074105.29038-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 25, 2021 at 08:41:05AM +0100, Lukas Bulwahn wrote:
> The command 'find ./kernel/rcu/ | xargs ./scripts/kernel-doc -none'
> reported an issue with the kernel-doc of struct rcu_tasks.
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/rcu/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied for the v5.13 merge window with the usual wordsmithing, thank you!

							Thanx, Paul

> ---
> applies cleanly on v5.11-rc5 and next-20210122
> 
> Paul, please pick this minor kerneldoc cleanup.
> 
>  kernel/rcu/tasks.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> index af7c19439f4e..17c8ebe131af 100644
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h
> @@ -20,7 +20,7 @@ typedef void (*holdouts_func_t)(struct list_head *hop, bool ndrpt, bool *frptp);
>  typedef void (*postgp_func_t)(struct rcu_tasks *rtp);
>  
>  /**
> - * Definition for a Tasks-RCU-like mechanism.
> + * struct rcu_tasks - Definition for a Tasks-RCU-like mechanism.
>   * @cbs_head: Head of callback list.
>   * @cbs_tail: Tail pointer for callback list.
>   * @cbs_wq: Wait queue allowning new callback to get kthread's attention.
> @@ -38,7 +38,7 @@ typedef void (*postgp_func_t)(struct rcu_tasks *rtp);
>   * @pregp_func: This flavor's pre-grace-period function (optional).
>   * @pertask_func: This flavor's per-task scan function (optional).
>   * @postscan_func: This flavor's post-task scan function (optional).
> - * @holdout_func: This flavor's holdout-list scan function (optional).
> + * @holdouts_func: This flavor's holdout-list scan function (optional).
>   * @postgp_func: This flavor's post-grace-period function (optional).
>   * @call_func: This flavor's call_rcu()-equivalent function.
>   * @name: This flavor's textual name.
> -- 
> 2.17.1
> 
