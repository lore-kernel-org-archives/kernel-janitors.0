From: Greg KH <greg@kroah.com>
Date: Fri, 04 Feb 2005 23:48:09 +0000
Subject: [KJ] Re: [PATCH] usb/io_edgeport: remove
Message-Id: <20050204234809.GC28862@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47225495628591041=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47225495628591041==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2005 at 01:15:21PM -0800, Nishanth Aravamudan wrote:
> On Tue, Feb 01, 2005 at 11:43:08AM -0800, Nishanth Aravamudan wrote:
> > On Mon, Jan 31, 2005 at 10:57:49AM -0800, Greg KH wrote:
> > > On Tue, Jan 25, 2005 at 04:49:18PM -0800, Nishanth Aravamudan wrote:
> > > > Hi,
> > > > 
> > > > Please consider applying.
> > > > 
> > > > Description: Use wait_event_timeout() instead of deprecated
> > > > interruptible_sleep_on_timeout(). Signals are not checked in the current code,
> > > > so interruptible should not be necessary. Patch is compile-tested.
> > > > 
> > > > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > > 
> > > Applied, thanks.
> > 
> > Greg,
> > 
> > This should fix the behavior of the previous patch (probably not noticed yet).
> > The wake_up*() was not matched properly in the first patch (fixed below). Please
> > consider reverting the previous patch and applying this one instead.
> > 
> > Thanks,
> > Nish
> > 
> > interruptible_sleep_on_timeout() in one place. Directly use wait-queues in
> > other locations to remove remaining callers of interruptible_sleep_on_timeout().
> > Signals are not checked in the current code, so interruptible should not be
> > necessary. Thus, the wake_up*() calls were modified to match the wait_event*()
> > ones. There were some naming conflicts, which I tried to resolve appropriately.
> > The final replacement is within a #if 0 / #endif section of code, but in case
> > that code is ever used again, I would prefer it had the correct interface :) 
> > Patch is compile-tested.
> 
> This and the mdc800 patch that I sent are incremental to fix wake_up*()
> callers, as Greg requested on IRC.
> 
> Thanks,
> Nish
> 
> Description:  Directly use wait-queues to remove remaining callers of
> interruptible_sleep_on_timeout(). Signals are not checked (except in one case) 
> in the current code, so interruptible should not be necessary. Modify the
> wake_up*() calls to match the wait-queue usage. There were some naming conflicts,
> which I tried to resolve appropriately. The final replacement is within a #if 0 /
> #endif section of code, but in case that code is ever used again, I would prefer
> it had the correct interface :) Patch is compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============47225495628591041==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47225495628591041==--
