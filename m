From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 27 Jun 2012 20:58:06 +0000
Subject: Re: [patch -resend] [SCSI] isci: add a couple __iomem annotations
Message-Id: <CABE8wwt-56EzC4Tmh8FyGPS+ftgNz3EAh7qfRxpc9CZizOqQqQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
	<20120627090521.GM31212@elgon.mountain>
In-Reply-To: <20120627090521.GM31212@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Intel SCU Linux support <intel-linux-scu@intel.com>, Dave Jiang <dave.jiang@intel.com>, Ed Nadolski <edmund.nadolski@intel.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 27, 2012 at 2:05 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> These are __iomem. =A0Sparse complains if we don't have that.
>
> drivers/scsi/isci/phy.c +149 70: warning:
> =A0 =A0 =A0 =A0incorrect type in initializer (different address spaces)
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Sent on Wed, 18 Jan 2012.
>

Thanks for nudge, this fell off the radar.  I'll get this into -next
with the rest of the pending bits.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
