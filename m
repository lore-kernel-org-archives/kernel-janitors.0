From: Greg KH <greg@kroah.com>
Date: Mon, 31 Jan 2005 18:58:20 +0000
Subject: [KJ] Re: [PATCH 33/39] usb/ati_remote: use wait_event_timeout()
Message-Id: <20050131185820.GD21986@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20309843649973125=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20309843649973125==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 01:31:27PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. The
> current code uses TASK_INTERRUPTIBLE but doesn't seem to care about signals
> so TASK_UNINTERRUPTIBLE should be ok.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============20309843649973125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20309843649973125==--
