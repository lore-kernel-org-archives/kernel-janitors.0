From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 12:45:11 +0000
Subject: Re: staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <566EB9D7.9090904@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <566D7952.7090401@users.sourceforge.net> <20151214110003.GV5284@mwanda>
 <566EB03E.2000007@users.sourceforge.net> <20151214123840.GX5284@mwanda>
In-Reply-To: <20151214123840.GX5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Oleg Drokin <oleg.drokin@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, lustre-devel@lists.lustre.org

>> Can you accept the proposed changes around the affected memory allocations?
> 
> Just leave it as-is if there is no reason.

I suggest to make the implementation of the function "mgc_process_recover_log"
a bit more efficient.


>> Do you prefer to stash any changes together for a bigger update step?
> 
> Yes.  Patches 5 and 6 would be easier to review if they were folded into
> one patch.

I do not like patch squashing for my update suggestions here.

Regards,
Markus
