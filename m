From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 23:35:56 +0000
Subject: [Kernel-janitors] Re: [PATCH] pci: replace schedule_timeout() with
Message-Id: <20040802233555.GA16152@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4136645813957367=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4136645813957367==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 02:54:02PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee
> the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============4136645813957367==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4136645813957367==--
