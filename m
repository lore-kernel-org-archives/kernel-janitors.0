From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 18:58:10 +0000
Subject: [KJ] Re: [PATCH 34/39] usb/auerswald: use wait_event_timeout()
Message-Id: <20050131185810.GC21986@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============088441536945847776=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============088441536945847776==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 01:33:58PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. There
> might be a problem with returning without adding/removing to the waitqueue
> before wait_event_timeout() is called. I am not sure if this is a problem or
> not.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============088441536945847776==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============088441536945847776==--
