From: Greg KH <gregkh@suse.de>
Date: Fri, 09 Jul 2010 15:05:49 +0000
Subject: Re: [PATCH] staging/wlan-ng: reflects NL80211 API change
Message-Id: <20100709150549.GA13555@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277684197.9983.7.camel@lenovo>
In-Reply-To: <1277684197.9983.7.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Jul 09, 2010 at 12:50:14AM -0400, Javier Martinez Canillas wrote:
> >>
> >> The problem is that the 802.11 netlink interface changed and the drive=
r was not updated
> >
> > This needs to go through the wireless tree, care to send it there? =A0It
> > just caused a build error in my tree if I was to take it :(
> >
> > thanks,
> >
> > greg k-h
> >
>=20
> Greg,
>=20
> I look at wireless-next-2.6 and wireless-testing, none of them have
> the same wlan-ng driver version that linux-next has.
>=20
> I have seen this situation many times:
>=20
> 1- Someone change and API in a subsystem tree (wirless, pcmcia, block, et=
c).
> 2- linux-next tree pull these API changes.
> 3- The other trees doesn't have the last (or at least the same) driver
> version that linux-next has.
> 4- Due the API change the drivers doesn't compile anymore. Both trees
> compile cleanly separate but when they got merged, problems arises.
>=20
> Because it is an API change, I'm told to send patches through
> subsystem trees. But I can't do that because that trees doesn't have
> the same driver version as linux-next has.
>=20
> Please tell me how do I have to proceed in these situations. Or tell
> me if there is a special integration tree for staging (besides
> linux-next) that I can use to generate my patches against.

Hm, you're right, it's a mess :)

I'll just keep this patch in my "to-apply" queue and watch for the api
change to hit Linus's tree and then queue it up to him when needed.

Sound good?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
