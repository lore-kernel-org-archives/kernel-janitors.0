From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 15 Nov 2019 15:55:53 +0000
Subject: Re: [PATCH][next] ftrace: fix spelling mistake "wakeing" -> "waking"
Message-Id: <a6bcd086-7892-a547-7c24-a64ba2bcc645@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115085938.38947-1-colin.king@canonical.com>
 <20191115105456.29444b06@gandalf.local.home>
In-Reply-To: <20191115105456.29444b06@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/11/2019 15:54, Steven Rostedt wrote:
> On Fri, 15 Nov 2019 08:59:38 +0000
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a spelling mistake in a trace_printk message. Fix it.
> 
> As this breaks the selftests, I'm folding this patch into the one that
> you sent that updates the selftests as well.

OK, thanks for that, much appreciated.

Colin

> 
> -- Steve
> 
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  samples/ftrace/ftrace-direct.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
>> index 1483f067b000..a2e3063bd306 100644
>> --- a/samples/ftrace/ftrace-direct.c
>> +++ b/samples/ftrace/ftrace-direct.c
>> @@ -6,7 +6,7 @@
>>  
>>  void my_direct_func(struct task_struct *p)
>>  {
>> -	trace_printk("wakeing up %s-%d\n", p->comm, p->pid);
>> +	trace_printk("waking up %s-%d\n", p->comm, p->pid);
>>  }
>>  
>>  extern void my_tramp(void *);
> 
