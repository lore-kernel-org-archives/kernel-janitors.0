From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 08 May 2015 01:32:34 +0000
Subject: Re: [HPDD-discuss] [PATCH] staging: lustre: code cleanup - variable declaration spacing
Message-Id: <A5138DD2-9B9B-4875-87A1-16953DAB9486@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430913775-28350-1-git-send-email-shuey@purdue.edu>
 <D1703976.EF0A5%andreas.dilger@intel.com> <20150507120908.GG14154@mwanda>
In-Reply-To: <20150507120908.GG14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Dilger, Andreas" <andreas.dilger@intel.com>, Mike Shuey <shuey@purdue.edu>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

Hello!

On May 7, 2015, at 8:09 AM, Dan Carpenter wrote:

>>> Clean up spacing in some variable declarations, to be more consistent.
>>> 
>>> It's small, but I need to start somewhere.  Please let me know if I'm not
>>> adhering to proper procedure for trivial cleanups.
>> 
>> It's actually Lustre coding style to align the variable declarations.
>> Is this something that causes checkpatch.pl to complain?  If not, I'd
>> prefer not to change all of these declarations, since it causes a lot
>> of code churn for very little benefit.
> In theory it's nice, but in reality aligning variables doesn't work in
> .c files.  If you look at the patch, almost every declaration block uses
> higgledy piggledy alignment.

I suspect that that's artefact of the initial code submission where the
mostly spaces used for tabs were converted to tabs in some automated manner,
which combined with typedefs removals (also done in automated manner)
like cfs_spinlock_t to spinlock_t and the like produced the result we can see.

Personally I don't care all that much about local variables alignments in the
functions, but alignment of struct members does help, I feel like, so I have been
trying to fix the alignment there whenever I was touching nearby code.

Bye,
    Oleg