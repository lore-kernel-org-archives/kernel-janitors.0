From: Greg KH <greg@kroah.com>
Date: Tue, 25 Jan 2005 06:27:08 +0000
Subject: [KJ] Re: [PATCH 39/39] w1/w1_therm: replace schedule_timeout() with
Message-Id: <20050125062708.GA2361@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45716787378184875=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050122011746.55a3585b@zanzibar.2ka.mipt.ru>
In-Reply-To: <20050122011746.55a3585b@zanzibar.2ka.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============45716787378184875==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 22, 2005 at 01:17:46AM +0300, Evgeniy Polyakov wrote:
> > Hi,
> 
> > Please consider applying.
> 
> > Description: Use msleep_interruptible() instead of schedule_timeout() to
> > guarantee the task delays as expected. Changed tm to an int, as it now is in
> > terms of msecs, not jiffies.
> 
> I've applied it to my tree, thank you.
> 
> Greg please push it upstream.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> Signed-off-by: Evgeniy Polyakov <johnpol@2ka.mipt.ru>

Applied, thanks.

greg k-h

--===============45716787378184875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45716787378184875==--
