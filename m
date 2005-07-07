From: Jesse Millan <jessem@cs.pdx.edu>
Date: Thu, 07 Jul 2005 21:14:13 +0000
Subject: Re: [KJ] Re: GCC4 warning: no return statement in function returning
Message-Id: <42CD9B25.7050706@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050701221504.GA26388@homer.coderock.org>
In-Reply-To: <20050701221504.GA26388@homer.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



randy_dunlap wrote:
> On Sat, 2 Jul 2005 00:22:51 +0200 Domen Puncer wrote:
> 
> | On 02/07/05 00:15 +0200, Domen Puncer wrote:
> | > On 01/07/05 11:19 -0700, Jesse Millan wrote:
> | > > -int kauditd_thread(void *dummy)
> | > > +void kauditd_thread(void *dummy)
> | > 
> | > This should warn too, as kthread_create() (kthread_run()) accepts
> | > int (*threadfn)(void *data)
> | > 
> | > I think kauditd_thread() should be fixed here to return something...
> | > "The return value should be zero or a negative error number:
> | >  it will be passed to kthread_stop()."
> | 
> | But it doesn't return at all (d'oh, should have seen this before).
> | Still... there's a warning if it returns void, right?
> 
> so it needs 
>   __attribute__((noreturn))
> added to the function?
> (or ATTRIB_NORET)
> 
> ---
> ~Randy
> 

Using the noreturn attribute implies to me that the return type should
be void. That can't be because kthread_run() expects a pointer to a
function that returns an int. Any return statement after the while(1) is
unreacable as Domen pointed out...

Could you clarify what needs to be done?

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
