From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 18:50:53 +0000
Subject: [KJ] Re: [PATCH 35/39] usb/hid-core: use wait_event_timeout()
Message-Id: <20050131185053.GA21871@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53090370808944609=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53090370808944609==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 01:35:01PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> now unused variables.

This code does not even compile :(

greg k-h

--===============53090370808944609==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53090370808944609==--
