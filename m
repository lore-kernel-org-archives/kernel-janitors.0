From: Michael Still <mikal@stillhq.com>
Date: Thu, 18 Mar 2004 01:04:03 +0000
Subject: [Kernel-janitors] kernel-doc comment tweak patches
Message-Id: <4058F583.9000109@stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Here come a bunch of relatively trivial patches to fix incorrect 
kernel-doc documentation comments. The documentation build system can 
inform you of comments which don't match the actual signature of the 
function being documented, all I've done for these is run through a few 
in the list and have a go at correcting the comments.

If people are interested, I can post a list of the other comments which 
are wrong...

Cheers,
Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
