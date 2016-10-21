From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Oct 2016 07:51:43 +0000
Subject: Re: [PATCH 5/6] FRV-setup: Fix indentation in two lines
Message-Id: <20161021075142.GS4469@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
 <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
 <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
In-Reply-To: <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

I don't think changing check_patch.pl or CodingStyle will help...

I've banned Markus from sending cleanups in parts of the kernel where I
have a voice (drivers/staging).  Bugfixes are welcome, but cleanups are
not.  I've done this before for other people who introduce a bunch of
bugs in clean up patches.

It's all about ratios...  Each clean up patch has chance of introducing
a bug.  If you only send clean up patches then you only introduce bugs.
We really don't want people sending patches if they introduce more bugs
than they fix.

regards,
dan carpenter


