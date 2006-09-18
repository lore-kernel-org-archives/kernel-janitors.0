From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 18 Sep 2006 05:19:16 +0000
Subject: [KJ] Error handling strings
Message-Id: <1158556036.28299.9.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

In almost all the drivers no error message is thrown if
create_proc_entry fails.

I went on to add the KERN_ERR/KERN_WARNING messages as appropriate.Like:
printk(KERN_WARNING "Unable to create 'fasttimer' proc entry.\n");

But the drawback is - every such error message added with increase the
code size because of the string used in the error messages.

Is there a way we can avoid this. Can we define a common error string in
say kernel.h (??) and use that in all printks.. 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
