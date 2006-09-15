From: ed <ed@s5h.net>
Date: Fri, 15 Sep 2006 21:03:41 +0000
Subject: Re: [KJ] while(1) fork() problem
Message-Id: <20060915220341.02533051@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060915035812.39772.qmail@web55412.mail.re4.yahoo.com>
In-Reply-To: <20060915035812.39772.qmail@web55412.mail.re4.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 14 Sep 2006 20:58:12 -0700 (PDT)
nikhil mishra <ls_niks@yahoo.com> wrote:

> hello concerned 
> while(1)
> fork();
> why this code has a problem is quite understood .

Well that should be obvious. Fork creates a copy of the process.
while(1) has no loop limit. What do you think happens if you keep
copying the process? Whats worse, when those running copies reach the
edge of the loop they themselves fork()... Very soon something has to
give.

> what can be the solution ?

Change while(1) to while(1=2).

-- 
Regards, Ed                      :: http://www.linuxwarez.co.uk
proud unix person
Vin Diesel stole my frog. Him name is Hopkin Green Frog. 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
