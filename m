From: Greg KH <greg@kroah.com>
Date: Fri, 04 Feb 2005 23:47:54 +0000
Subject: [KJ] Re: [PATCH] usb/mdc800: replace wake_up() with
Message-Id: <20050204234754.GB28862@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66655103444860475=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66655103444860475==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2005 at 01:07:17PM -0800, Nishanth Aravamudan wrote:
> On Tue, Feb 01, 2005 at 11:51:36AM -0800, Nishanth Aravamudan wrote:
> > On Mon, Jan 31, 2005 at 10:58:02AM -0800, Greg KH wrote:
> > > On Fri, Jan 21, 2005 at 01:37:39PM -0800, Nishanth Aravamudan wrote:
> > > > Hi,
> > > > 
> > > > Please consider applying.
> > > > 
> > > > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > > > now unused variables.
> > > > 
> > > > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > > 
> > > Applied, thanks.
> > 
> > Greg,
> > 
> > This should fix the behavior of the previous patch (probably not noticed yet).
> > The wake_up*() was not matched properly in the first patch (fixed below). Please
> > consider reverting the previous patch and applying this one instead. I think it
> > may actually have been somewhat broken in the original code, actually :)
> 
> Description: Modify the wake_up*() calls to match the wait_event*() ones
> from a previous patch.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============66655103444860475==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66655103444860475==--
