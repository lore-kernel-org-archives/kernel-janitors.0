From: Greg KH <greg@kroah.com>
Date: Mon, 01 Nov 2004 23:28:55 +0000
Subject: [KJ] Re: [PATCH] pci/quirks: replace schedule_timeout() with
Message-Id: <20041101232855.GA18162@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51879843270095227=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51879843270095227==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2004 at 04:54:14PM -0700, Nishanth Aravamudan wrote:
> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the
> task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============51879843270095227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51879843270095227==--
