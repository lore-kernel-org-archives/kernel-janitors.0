From: "Gabriel L. Somlo" <somlo@cmu.edu>
Date: Thu, 14 Apr 2016 19:36:14 +0000
Subject: Re: [patch] firmware: qemu_fw_cfg.c: potential unintialized variable
Message-Id: <20160414193614.GE7821@HEDWIG.INI.CMU.EDU>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414093337.GD16549@mwanda>
 <20160414184005.GC7821@HEDWIG.INI.CMU.EDU>
 <20160414191253.GH4247@mwanda>
In-Reply-To: <20160414191253.GH4247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2016 at 10:12:53PM +0300, Dan Carpenter wrote:
> On Thu, Apr 14, 2016 at 02:40:06PM -0400, Gabriel L. Somlo wrote:
> > On Thu, Apr 14, 2016 at 12:33:37PM +0300, Dan Carpenter wrote:
> > > It acpi_acquire_global_lock() return AE_NOT_CONFIGURED then "glk" isn't
> >   ^                               ^
> >   If                            returns
> > 
> > > initialized, which, if you got very unlucky, could cause a bug.
> > 
> > 
> > In principle I'm OK with being cautious and initializing local
> > variables just in case, but I'm curious:
> > 
> > acpi_acquire_global_lock() (and its friend, acpi_release_global_lock())
> > are both wrapped inside the same macro -- ACPI_HW_DEPENDENT_RETURN_STATUS
> > -- which either makes them both do something useful, or makes them both
> > no-ops returning a hardcoded AE_NOT_CONFIGURED.
> > 
> > So what else do you think could be a way to get very unlucky ?
> 
> If "glk" happened to to equal acpi_gbl_global_lock_handle by chance
> then we would release it without acquiring it first.  Actually I could
> initialize it to zero and that would be better, no?

No, because acpi_release_global_lock() would also be a hard-coded
"return AE_NOT_CONFIGURED" by the same macro which also hard-coded
acpi_acquire_global_lock() to be "return AE_NOT_CONFIGURED" in the
first place. See include/acpi/acpixf.h, search for the two occurrences
of

	"#define ACPI_HW_DEPENDENT_RETURN_STATUS"

and then for:

	"global_lock"

further down in the file.

Whether both (or neither) of lock/unlock are for real or just
hardcoded to return AE_NOT_CONFIGURED depends on ACPI_REDUCED_HARDWARE,
which I assume is also set when there's *no* ACPI hardware at all.

But I don't believe it's possible for "unlock" to do anything at all
if "lock" was hardcoded to simply return AE_NOT_CONFIGURED.

Then again, it's possible I'm still missing something :)

Thanks,
--Gabe
