From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 21 Dec 2015 23:48:57 +0000
Subject: Re: [PATCH v2 3/4] staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <20151221234857.GA27079@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <56784D83.7080108@users.sourceforge.net>
 <56784F0C.6040007@users.sourceforge.net>
In-Reply-To: <56784F0C.6040007@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Dec 21, 2015 at 08:12:12PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 21 Dec 2015 18:58:51 +0100
> 
> A few checks would be performed by the mgc_process_recover_log() function
> even though it was determined that the passed variable "pages" contained
> a null pointer or a call of the alloc_page() function failed.
> 
> 1. Let us return directly if a call of the kcalloc() function failed.
> 
> 2. Corresponding implementation details could be improved by adjustments
>    for jump targets according to the Linux coding style convention.
> 
> 3. Delete sanity checks then.
> 
> 4. Move an assignment for the variable "eof" behind memory allocations.
> 
> 5. The variable "req" will eventually be set to an appropriate pointer
>    from a call of the ptlrpc_request_alloc() function.
>    Thus let us omit the explicit initialisation before.
> 
> 6. Apply a recommendation from the script "checkpatch.pl".

That's 6 different things, shouldn't this be 6 different patches?

please redo.

thanks,

greg k-h
