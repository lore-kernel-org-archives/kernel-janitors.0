From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 23 Feb 2004 00:23:06 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040222162306.1e587b6f.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 22 Feb 2004 13:05:20 +0100 Carlo Perassi <carlo@linux.it> wrote:

| > I have most of these merged, but some of the changes no longer
| > apply.  Please rediff and resend the changes for:
| > 
| > drivers/net/3c527.c
| > drivers/net/tc35815.c
| > drivers/net/68360enet.c
| > 
| > (against 2.6.3).
| 
| - a patch for drivers/net/3c527.c is attached
| - drivers/net/tc35815.c is fine
| - drivers/net/68360enet.c doesn't exist. which file do you mean?

Hm, that's a good question.  Your 90patches tarball had a patch
like so:
--- drivers/net/68360enet.c	2004-01-09 07:59:10.000000000 +0100
+++ mod/drivers/net/68360enet.c	2004-01-25 01:39:25.000000000 +0100

in "files8m2RO".  So where/why did you make that patch?

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
