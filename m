From: Adrian Bunk <bunk@stusta.de>
Date: Mon, 09 Oct 2006 06:23:29 +0000
Subject: Re: [KJ] Is kfree(ptr) [ptr = NULL] allowed?
Message-Id: <20061009062329.GB3172@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061009055409.14227.qmail@web55613.mail.re4.yahoo.com>
In-Reply-To: <20061009055409.14227.qmail@web55613.mail.re4.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 08, 2006 at 10:54:09PM -0700, Amit Choudhary wrote:

> Hi All,
> 
> kfree(ptr) returns without doing anything if ptr is NULL.
> 
> So, can I call kfree(ptr) in my code even if ptr is NULL? Is it allowed, or should I check the
> value of ptr first and then call kfree()?

kfree(NULL) is allowed.

> Regards,
> Amit Choudhary

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
