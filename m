From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Mar 2007 07:46:01 +0000
Subject: [KJ] how to generate a multi-part patch?
Message-Id: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  what's the canonical way to generate a multi-part patch?  that is,
starting from "PATCH [0/n]" and so on.  a list of bullet points will
do fine, i can take it from there.

  from what i read, i'd use quilt to generate the patch set, then
"git-send-email"?  is that it?  thanks.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
