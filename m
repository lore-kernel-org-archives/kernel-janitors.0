From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 10 Feb 2005 21:34:00 +0000
Subject: Re: [KJ] kj-devel.pl
Message-Id: <420BD348.4020300@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
In-Reply-To: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> 
> The second script it's just the removal of strlen and sprintf checks, I'll be 
> adding some more things to this.

Here are a few more false reports, if you are interested, from the 
linux/ipc/ directory:

Should be return -E ?mqueue.c:1453:			return ERR_PTR(-EFAULT);
Should be return -E ?mqueue.c:1455:			return ERR_PTR(-EINVAL);
Should be return -E ?mqueue.c:1463:		return ERR_PTR(ret);
Should be return -E ?mqueue.c:1480:		return ERR_PTR(-EINVAL);
Should be return -E ?mqueue.c:1483:		return ERR_PTR(-EACCES);
Should be return -E ?msg.c:1453:			return ERR_PTR(-EFAULT);
Should be return -E ?msg.c:1455:			return ERR_PTR(-EINVAL);
Should be return -E ?msg.c:1463:		return ERR_PTR(ret);
Should be return -E ?msg.c:1480:		return ERR_PTR(-EINVAL);
Should be return -E ?msg.c:1483:		return ERR_PTR(-EACCES);


and some good ones:

Bad. Should use set_current_state.
msg.c:2230:	current->state=TASK_INTERRUPTIBLE;

Bad. Should use set_current_state.
msg.c:2836:		current->state = TASK_INTERRUPTIBLE;


Any idea what this message means?

Unmatched ) in regex; marked by <-- HERE in m/spin_unlock.*) <-- HERE 
  inside ipc_lock_by_ptr(/ at /home/rddunlap/scripts/kj-devel-vic2.pl 
line 61.


 From the linux/lib/ directory, I am seeing comment lines not being
skipped:

strtok() is racy on smp, use strsep() instead.
string.c:7440: * -  Added strsep() which will replace strtok() soon 
(because strsep() is

strtok() is racy on smp, use strsep() instead.
string.c:7445: * -  Kissed strtok() goodbye

strtok() is racy on smp, use strsep() instead.
vsprintf.c:7440: * -  Added strsep() which will replace strtok() soon 
(because strsep() is

strtok() is racy on smp, use strsep() instead.
vsprintf.c:7445: * -  Kissed strtok() goodbye

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
