From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Thu, 21 Sep 2006 23:51:13 +0000
Subject: [KJ] request_region() error checking
Message-Id: <1158882673.10459.13.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

While looking through the code, I noticed that various drivers
doesn't check the failure for request_region(). I also saw
this on kernel-janitors TODO list.

Is anyone working on cleaning these ? I plan to start cleaning
up some one them on my free time, hate to duplicate the effort.
And also, if some one has gone through it already and there is
a *valid* reason for not doing it - please let me know. I won't
waste my time :)

Thanks,
Badari 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
