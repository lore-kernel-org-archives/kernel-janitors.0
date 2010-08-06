From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Fri, 06 Aug 2010 08:47:53 +0000
Subject: Re: [PATCH] kprobes: add sparse context annotation
Message-Id: <4C5BCC39.5000502@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
> this removes following warnings when build with C=1
> 
>  warning: context imbalance in 'kretprobe_hash_lock' - wrong count at exit
>  warning: context imbalance in 'kretprobe_table_lock' - wrong count at exit
>  warning: context imbalance in 'kretprobe_hash_unlock' - unexpected unlock
>  warning: context imbalance in 'kretprobe_table_unlock' - unexpected unlock

Good catch :)

Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

Thanks!

> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index c53aad5..89b7ef5 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -831,6 +831,7 @@ void __kprobes recycle_rp_inst(struct kretprobe_instance *ri,
>  
>  void __kprobes kretprobe_hash_lock(struct task_struct *tsk,
>  			 struct hlist_head **head, unsigned long *flags)
> +__acquires(hlist_lock)
>  {
>  	unsigned long hash = hash_ptr(tsk, KPROBE_HASH_BITS);
>  	spinlock_t *hlist_lock;
> @@ -842,6 +843,7 @@ void __kprobes kretprobe_hash_lock(struct task_struct *tsk,
>  
>  static void __kprobes kretprobe_table_lock(unsigned long hash,
>  	unsigned long *flags)
> +__acquires(hlist_lock)
>  {
>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>  	spin_lock_irqsave(hlist_lock, *flags);
> @@ -849,6 +851,7 @@ static void __kprobes kretprobe_table_lock(unsigned long hash,
>  
>  void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>  	unsigned long *flags)
> +__releases(hlisk_lock)
>  {
>  	unsigned long hash = hash_ptr(tsk, KPROBE_HASH_BITS);
>  	spinlock_t *hlist_lock;
> @@ -859,6 +862,7 @@ void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>  
>  static void __kprobes kretprobe_table_unlock(unsigned long hash,
>         unsigned long *flags)
> +__releases(hlisk_lock)
>  {
>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>  	spin_unlock_irqrestore(hlist_lock, *flags);

