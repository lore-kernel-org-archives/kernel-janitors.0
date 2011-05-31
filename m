From: Greg KH <greg@kroah.com>
Date: Tue, 31 May 2011 04:49:52 +0000
Subject: Re: Janitor-Question: use __set_bit instead of |=
Message-Id: <20110531044952.GB31219@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201105302323.43979.PeterHuewe@gmx.de>
In-Reply-To: <201105302323.43979.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, May 30, 2011 at 11:23:40PM +0200, Peter H=FCwe wrote:
> Hi Janitors, staging-list
>=20
> what is your opinion on using set_bit instead of using |=3D to set a bit?
> Is it worth the effort to convert  existing |=3D to set_bit?

I doubt converting existing stuff is needed, but any future stuff is
always nice to use set_bit() for the reasons you suggest.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
