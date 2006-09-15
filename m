From: Amol Lad <amol@verismonetworks.com>
Date: Fri, 15 Sep 2006 11:51:30 +0000
Subject: [KJ] proc entry path name
Message-Id: <1158320370.26510.62.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm doing create_proc_entry return code audit. On failure I would like
to print "Unable to create /proc/foo/bar". 

Is there a function that takes struct proc_dir_entry * and returns
fullpathname ?



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
