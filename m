From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 07:15:23 +0000
Subject: Re: [PATCH v2 3/4] staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <5678F88B.7060201@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <56784D83.7080108@users.sourceforge.net>
 <56784F0C.6040007@users.sourceforge.net> <20151221234857.GA27079@kroah.com>
In-Reply-To: <20151221234857.GA27079@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Dan Carpenter <dan.carpenter@oracle.com>

>> 6. Apply a recommendation from the script "checkpatch.pl".
> 
> That's 6 different things, shouldn't this be 6 different patches?
> 
> please redo.

Dan Carpenter requested to squash the previous update steps 5 and 6
into a single patch for better source code review.
Now I see further software development challenges to increase
the patch granularity even more as you suggest.

Which route would Lustre developers like to follow?

Regards,
Markus
