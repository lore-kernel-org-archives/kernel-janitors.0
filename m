From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 18:51:59 +0000
Subject: [KJ] Re: [PATCH 36/39] usb/kaweth: use wait_event_timeout()
Message-Id: <20050131185159.GB21871@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72817735384888405=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72817735384888405==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 01:36:35PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> now unused variables. I changed the code to only add to the wait-queue if
> necessary, but I'm not sure if this is correct.

Please at least compile your patches to make sure they build.  This one
does not :(

greg k-h

--===============72817735384888405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72817735384888405==--
