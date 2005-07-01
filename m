From: Jesse Millan <jesse.millan@gmail.com>
Date: Fri, 01 Jul 2005 22:59:14 +0000
Subject: [KJ] Re: GCC4 warning: no return statement in function returning
Message-Id: <42C5CAC2.50104@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050701221504.GA26388@homer.coderock.org>
In-Reply-To: <20050701221504.GA26388@homer.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Domen Puncer wrote:
> On 02/07/05 00:15 +0200, Domen Puncer wrote:
> 
>>On 01/07/05 11:19 -0700, Jesse Millan wrote:
>>
>>>-int kauditd_thread(void *dummy)
>>>+void kauditd_thread(void *dummy)
>>
>>This should warn too, as kthread_create() (kthread_run()) accepts
>>int (*threadfn)(void *data)
>>
>>I think kauditd_thread() should be fixed here to return something...
>>"The return value should be zero or a negative error number:
>> it will be passed to kthread_stop()."
> 
> 
> But it doesn't return at all (d'oh, should have seen this before).
> Still... there's a warning if it returns void, right?
> 
> 
> 	Domen
> 


Yes, missed that. Chaning the return type removes one warning and adds
another:

kernel/audit.c:386: warning: passing argument 1 of 'kthread_create' from
incompatible pointer type

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
