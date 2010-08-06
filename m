From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Fri, 06 Aug 2010 08:48:51 +0000
Subject: Re: [PATCH] kprobes: add sparse context annotation
Message-Id: <4C5BCC73.30306@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281082375-13356-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ananth N Mavinakayanahalli wrote:
> On Fri, Aug 06, 2010 at 05:12:55PM +0900, Namhyung Kim wrote:
> 
>>  void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>>  	unsigned long *flags)
>> +__releases(hlisk_lock)
> 
> You surely meant hlist_lock, didn't you?
> 
>>  {
>>  	unsigned long hash = hash_ptr(tsk, KPROBE_HASH_BITS);
>>  	spinlock_t *hlist_lock;
>> @@ -859,6 +862,7 @@ void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>>
>>  static void __kprobes kretprobe_table_unlock(unsigned long hash,
>>         unsigned long *flags)
>> +__releases(hlisk_lock)
> 		^^^^^^
>>  {
>>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>>  	spin_unlock_irqrestore(hlist_lock, *flags);
>> -- 
>> 1.7.0.4

Oops, right...

-- 
Masami HIRAMATSU
2nd Research Dept.
Hitachi, Ltd., Systems Development Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
