From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Mar 2012 05:33:54 +0000
Subject: Re: [patch] ALSA: asihpi - fix return type of hpios_locked_mem_alloc()
Message-Id: <s5hk424t1h9.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120328065702.GA9113@elgon.mountain>
	<s5hiphoyemc.wl%tiwai@suse.de> <4F7385F8.4050004@audioscience.com>
In-Reply-To: <4F7385F8.4050004@audioscience.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliot Blennerhassett <eblennerhassett@audioscience.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

At Thu, 29 Mar 2012 10:43:20 +1300,
Eliot Blennerhassett wrote:
> 
> On 29/03/12 03:38, Takashi Iwai wrote:
> > At Wed, 28 Mar 2012 09:57:02 +0300,
> > Dan Carpenter wrote:
> >>
> >> This function returns zero or -ENOMEM, but because it's type is u16, the
> >> -ENOMEM gets changed to 65524.  None of the callers care, but lets fix
> >> it anyway as a cleanup.
> >>
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Applied it now.  Thanks.
> 
> Hmm. I guess it is too late to NAK this change?

Yes, Dan's fix itself is correct, so no big reason to revert.

> I'd prefer changing the return value to HPI_ERROR_MEMORY_ALLOC and
> leaving the function signature alone.

It's fine to change to HPI_ERROR_MEMORY_ALLOC.  Just write another
patch to change it appropriately and submit.

But, if we change in that way, we should think again over the return
type of these functions, too.  If functions are supposed to return
these specific error numbers, they should return rather enum
HPI_ERROR_CODES type instead of u16.  Otherwise it's misleading and an
error like this can happen again.

Or, follow the common style, returning int with 0 or a negative error
number.


thanks,

Takashi
