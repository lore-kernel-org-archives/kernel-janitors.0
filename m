From: Greg KH <greg@kroah.com>
Date: Thu, 20 Jan 2005 23:26:27 +0000
Subject: Re: [KJ] [PATCH 21/21] usb/cypress_m8: replace schedule_timeout()
Message-Id: <20050120232627.GB13864@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============075767616948226202=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050118002703.GD24698@us.ibm.com>
In-Reply-To: <20050118002703.GD24698@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============075767616948226202==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:27:03PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying. 
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The current code is not incorrect. Using msleep(), though,
> encourages specifying time delays in human time-units and consistency across the
> kernel.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============075767616948226202==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============075767616948226202==--
