From: Scott Lovenberg <scott.lovenberg@gmail.com>
Date: Mon, 07 Jul 2008 04:56:12 +0000
Subject: Re: mixing interupts and threads.
Message-Id: <4871A1EC.2070405@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <48719C96.6010503@gmail.com>
In-Reply-To: <48719C96.6010503@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ravikumar wrote:
> Hello All ,
> I've a few questions.
> 1. Lets suppose i've some critical section and it is synchronized with 
> locks. A thread came and  it's  execution  is in the middle of 
> critical section, at this time an interrupt was occurred which  also 
> executes critical section. As interrupts can't wait on any lock it 
> will get lock and try to execute the critical section and above thread 
> was not yet completed. So inconsistency . How this was handled in Linux.
> 2.Some process is running in kernel mode, at this a kill was sent to 
> this process, does this signal will delivered to the process while it 
> is in kernel mode.
>
> And also please provide some links  how threads ,signals and 
> interrupts will be mixed.
>
> Regards,
> Ravikumar.
1.)This should play out slightly different on uniprocessor vs. SMP, but, 
IIRC, during a critical section on uniprocessor IRQs are masked and 
queued as they come in.  In SMP, they should be routed to another 
processor, which should queue them if they need locked resources.  
Someone please correct me if I'm incorrect.

2.)I do not know the answer to this question. :)  Does anyone else know?

