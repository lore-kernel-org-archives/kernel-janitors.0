From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Date: Fri, 06 Aug 2010 08:53:22 +0000
Subject: Re: [PATCH] kprobes: add sparse context annotation
Message-Id: <20100806084122.GA30642@in.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 06, 2010 at 05:12:55PM +0900, Namhyung Kim wrote:

>  void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>  	unsigned long *flags)
> +__releases(hlisk_lock)

You surely meant hlist_lock, didn't you?

>  {
>  	unsigned long hash = hash_ptr(tsk, KPROBE_HASH_BITS);
>  	spinlock_t *hlist_lock;
> @@ -859,6 +862,7 @@ void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
> 
>  static void __kprobes kretprobe_table_unlock(unsigned long hash,
>         unsigned long *flags)
> +__releases(hlisk_lock)
		^^^^^^
>  {
>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>  	spin_unlock_irqrestore(hlist_lock, *flags);
> -- 
> 1.7.0.4
