From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 18:57:49 +0000
Subject: [KJ] Re: [PATCH 33/33] usb/io_edgeport: replace
Message-Id: <20050131185749.GA21986@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99412980090970438=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99412980090970438==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2005 at 04:49:18PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of deprecated
> interruptible_sleep_on_timeout(). Signals are not checked in the current code,
> so interruptible should not be necessary. Patch is compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============99412980090970438==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99412980090970438==--
