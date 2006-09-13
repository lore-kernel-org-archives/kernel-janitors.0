From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 13 Sep 2006 04:54:04 +0000
Subject: [KJ] create_proc_entry return code audit
Message-Id: <1158122524.7814.111.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm working on handling error return code for create_proc_entry.
Currently there are three ways the function is called
1. call create_proc_entry as a 'void' function
2. call create_proc_entry and directly use the return value without
checking if it's non-NULL
3. call create_proc_entry and check for non-NULL but do not throw any
warning message that create_proc_entry failed.

Method 3 is widely used followed by 1 and we have some cases for 2 also.

what do you folks suggest, we fix all three or only 1 & 2. I feel we
should fix 3 also and add a KERN_WARNING message for the same

Thanks

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
