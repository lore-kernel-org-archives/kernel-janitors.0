From: Amit Choudhary <amit2030@yahoo.com>
Date: Mon, 09 Oct 2006 05:54:09 +0000
Subject: [KJ] Is kfree(ptr) [ptr = NULL] allowed?
Message-Id: <20061009055409.14227.qmail@web55613.mail.re4.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

kfree(ptr) returns without doing anything if ptr is NULL.

So, can I call kfree(ptr) in my code even if ptr is NULL? Is it allowed, or should I check the
value of ptr first and then call kfree()?

Regards,
Amit Choudhary

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
