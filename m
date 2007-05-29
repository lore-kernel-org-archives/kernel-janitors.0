From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 29 May 2007 09:29:07 +0000
Subject: [KJ] setting fops member pointers to NULL?
Message-Id: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there any rationale for setting a member of the file_operations
structure explicitly to NULL as opposed to leaving it initialized?  i
would think that's the default just based on the rules for C
initialization, but i just wanted to make sure since i see it done
every so often and wonder if there's something tricky going on that i
don't know about.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
