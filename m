From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 12:04:14 +0000
Subject: Re: [PATCH 5/7] staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <566EB03E.2000007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <566D7952.7090401@users.sourceforge.net> <20151214110003.GV5284@mwanda>
In-Reply-To: <20151214110003.GV5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> A few checks would be performed by the mgc_process_recover_log() function
>> even if it is known already that the passed variable "pages" contained
>> a null pointer.
>>
>> * Let us return directly if a call of the kcalloc() function failed.
>>
>> * Move assignments for the variables "eof" and "req" behind
>>   this memory allocation.
> 
> Why?

The positions of their initialisation depends on the selected exception 
handling implementation, doesn't it?

Can you accept the proposed changes around the affected memory allocations?


> Then in the next patch it moves again.

This detail is a matter of patch granularity.


> It's like cup shuffle to read these patches sometimes.

Do you prefer to stash any changes together for a bigger update step?

Regards,
Markus
