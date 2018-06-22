From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2018 11:18:18 +0000
Subject: [bug report] lib/kobject.c: use kvasprintf_const for formatting ->name
Message-Id: <20180622111818.vpdv72rtjgj7533g@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rasmus Villemoes,

This is a semi-automatic email about new static checker warnings.

The patch f773f32d71a4: "lib/kobject.c: use kvasprintf_const for
formatting ->name" from Nov 6, 2015, leads to the following Smatch
complaint:

    lib/kobject.c:262 kobject_set_name_vargs()
     error: we previously assumed 'fmt' could be null (see line 259)

lib/kobject.c
   258	
   259		if (kobj->name && !fmt)
                                   ^^^
   260			return 0;
   261	
   262		s = kvasprintf_const(GFP_KERNEL, fmt, vargs);
                                                 ^^^

This warning is really old, and I suddenly have a lot of them today.

I'm always dorking with Smatch so my version is never the released
version or even the same as the day before.  I haven't figured out why
I have so many of these warnings now.  But this looks like a legit
issue.

I think this a bug in Smatch, but we could change the check to if (!fmt)?

   263		if (!s)
   264			return -ENOMEM;

regards,
dan carpenter
