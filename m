From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 21:26:01 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/ov511: replace schedule_timeout()
Message-Id: <20040802212601.GB14283@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22799217974537234=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22799217974537234==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2004 at 05:48:06AM -0700, Mark McClelland wrote:
> Nishanth Aravamudan wrote:
> 
> >I would appreciate any comments from the janitors list. 
> >
> >Applys-to: 2.6.7
> >
> >Description: Use msleep() instead of schedule_timeout() to 
> >guarantee the task delays for the desired time.
> > 
> >
> 
> Looks good to me. Thank you very much for finding and fixing this, Nishanth.
> 
> >Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> >
> 
> Signed-off-by: Mark McClelland <mark@alpha.dyndns.org>

Applied, thanks.

greg k-h

--===============22799217974537234==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22799217974537234==--
