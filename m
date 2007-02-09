From: Surya <surya.prabhakar@wipro.com>
Date: Fri, 09 Feb 2007 07:10:45 +0000
Subject: [KJ] Finding 2.4 compatible drivers
Message-Id: <1171004325.29458.3.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

How do I know whether a driver is 2.4 compatible. 
The entry point for 2.4 drivers is init_module and for 2.6 is
module_init(init_xyz)

Is the only way to find the difference or is there any other way?

-surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
