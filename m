From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 21:17:06 +0000
Subject: [KJ] Re: [UPDATE PATCH 36/39] usb/kaweth: use wait_event_timeout()
Message-Id: <20050131211706.GA24346@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61786463414255755=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61786463414255755==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2005 at 11:40:22AM -0800, Nishanth Aravamudan wrote:
> On Mon, Jan 31, 2005 at 11:33:28AM -0800, Greg KH wrote:
> > On Mon, Jan 31, 2005 at 11:27:03AM -0800, Nishanth Aravamudan wrote:
> > > On Mon, Jan 31, 2005 at 10:51:59AM -0800, Greg KH wrote:
> > > > On Fri, Jan 21, 2005 at 01:36:35PM -0800, Nishanth Aravamudan wrote:
> > > > > Hi,
> > > > > 
> > > > > Please consider applying.
> > > > > 
> > > > > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > > > > now unused variables. I changed the code to only add to the wait-queue if
> > > > > necessary, but I'm not sure if this is correct.
> > > > 
> > > > Please at least compile your patches to make sure they build.  This one
> > > > does not :(
> > > 
> > > I'm not seeing a build error here; what errors are coming up for you?
> > 
> > Don't remember anymore, as I reverted the patch already...
> > 
> > I think it was a {} matching issue like your other patches.
> 
> You are right. I had actually fixed this, but didn't mail the updated diff.
> Sorry about that, Greg.
> 
> Please consider the following which builds cleanly.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> now unused variables. I changed the code to only add to the wait-queue if
> necessary, but I'm not sure if this is correct.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============61786463414255755==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61786463414255755==--
