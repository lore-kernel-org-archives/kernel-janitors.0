From: Greg KH <greg@kroah.com>
Date: Fri, 08 Apr 2005 18:31:55 +0000
Subject: [KJ] Re: [UPDATE PATCH] usb/digi_acceleport: correct wait-queue
Message-Id: <20050408183155.GB18987@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87370127307178835=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87370127307178835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 04, 2005 at 02:23:28PM -0700, Nishanth Aravamudan wrote:
> On Mon, Apr 04, 2005 at 11:10:53AM -0700, Nishanth Aravamudan wrote:
> > On Wed, Feb 02, 2005 at 11:03:09AM -0800, Nishanth Aravamudan wrote:
> > > Hello,
> > > 
> > > Description: Replace deprecated interruptible_sleep_on_timeout() with direct
> > > wait-queue usage. Also replace some rather odd wait-queue usage with the
> > > existent macros. Also adjusted the wake_up_interruptible() call appropriately,
> > > as I changed all the states to TASK_UNINTERRUPTIBLE (signals were not be checked
> > > in the current code). Patch is compile-tested.
> > 
> > Patch was broken in various ways. Fixed-up below (ends up being fewer
> > changes). Please drop previous patch and apply the attached.
> > 
> > Description: Replace deprecated interruptible_sleep_on_timeout() with
> > direct wait-queue usage. Patch is compile-tested.
> 
> Original patch was merged into 2.6.11-rc2. Incremental patch for
> 2.6.11-rc2 attached.
> 
> Description: First patch incorrectly changed state of the wait-queue
> usage to TASK_UNINTERRUPTIBLE. Reverted to TASK_INTERRUPTIBLE.

Applied, thanks.

greg k-h

--===============87370127307178835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87370127307178835==--
