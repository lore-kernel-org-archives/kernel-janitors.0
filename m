From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Dec 2015 08:00:15 +0000
Subject: Re: [PATCH v2 3/4] staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <20151222080015.GY5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <56784D83.7080108@users.sourceforge.net>
 <56784F0C.6040007@users.sourceforge.net>
 <20151221234857.GA27079@kroah.com>
In-Reply-To: <20151221234857.GA27079@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Oleg Drokin <oleg.drokin@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, lustre-devel@lists.lustre.org

On Mon, Dec 21, 2015 at 03:48:57PM -0800, Greg Kroah-Hartman wrote:
> 
> That's 6 different things, shouldn't this be 6 different patches?
> 

Not really.  The patch could be described as just "change from using one
exit label to using several."  Markus has sent a number of these patches
and I am CC'd on them because of kernel-janitors, it's really painful to
review when he breaks them up into tiny patches where he changes one
label at a time.  It's like trying to put coleslaw back together into a
head of cabbage.

> On Mon, Dec 21, 2015 at 08:12:12PM +0100, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 21 Dec 2015 18:58:51 +0100
> > 
> > A few checks would be performed by the mgc_process_recover_log() function
> > even though it was determined that the passed variable "pages" contained
> > a null pointer or a call of the alloc_page() function failed.
> > 
> > 1. Let us return directly if a call of the kcalloc() function failed.
> > 
> > 2. Corresponding implementation details could be improved by adjustments
> >    for jump targets according to the Linux coding style convention.
> > 
> > 3. Delete sanity checks then.

These are not sanity checks, of course.  They were required because of a
common exit path.

> > 
> > 4. Move an assignment for the variable "eof" behind memory allocations.

I had asked Markus not to do this.  It is unrelated.

> > 
> > 5. The variable "req" will eventually be set to an appropriate pointer
> >    from a call of the ptlrpc_request_alloc() function.
> >    Thus let us omit the explicit initialisation before.

Now that we use multiple labels it isn't necessary to initialize "req".

> > 
> > 6. Apply a recommendation from the script "checkpatch.pl".

This is where he changed pages[i] = NULL to !(pages[i]).  It's not
strictly related but it's minor and he was changing those lines anyway.

regards,
dan carpenter
