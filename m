From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 21:17:39 +0000
Subject: [KJ] Re: [UPDATE PATCH 35/39] usb/hid-core: use wait_event_timeout()
Message-Id: <20050131211739.GC24346@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41569700127239906=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41569700127239906==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2005 at 11:12:21AM -0800, Nishanth Aravamudan wrote:
> On Mon, Jan 31, 2005 at 10:50:53AM -0800, Greg KH wrote:
> > On Fri, Jan 21, 2005 at 01:35:01PM -0800, Nishanth Aravamudan wrote:
> > > Hi,
> > > 
> > > Please consider applying.
> > > 
> > > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > > now unused variables.
> > 
> > This code does not even compile :(
> 
> Sorry about that, Greg. Fixed with patch below:
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> now unused variables.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============41569700127239906==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41569700127239906==--
