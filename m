From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 21:26:45 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/usbnet: replace
Message-Id: <20040802212645.GD14283@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96307585550002983=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41073864.1050407@pacbell.net>
In-Reply-To: <41073864.1050407@pacbell.net>
To: kernel-janitors@vger.kernel.org

--===============96307585550002983==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2004 at 12:35:59PM -0700, Nishanth Aravamudan wrote:
> On Wed, Jul 28, 2004 at 08:54:34AM -0700, Nishanth Aravamudan wrote:
> > On Tue, Jul 27, 2004 at 10:23:48PM -0700, David Brownell wrote:
> > > Nishanth Aravamudan wrote:
> > > >I would appreciate any comments from the janitors list. 
> > > >
> > > >Applys-to: 2.6.7
> > > >
> > > >Description: Use msleep() instead of schedule_timeout() to 
> > > >guarantee the task delays for the desired time.
> > > 
> > > Please define and use UNLINK_TIMEOUT_MS, instead.
> > > Or better yet, switch to wait_event() ...
> > 
> > Please find the first of these changes below. Thanks.
> 
> The previous patch inserted extraneous whitespace. Please find the
> corrected version below. Also, the unused UNLINK_TIMEOUT_JIFFIES is
> removed.
> 
> -Nish
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the
> task delays for the desired time. Delete unused UNLINK_TIMEOUT_JIFFIES
> #define.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============96307585550002983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96307585550002983==--
