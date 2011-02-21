From: Greg KH <greg@kroah.com>
Date: Mon, 21 Feb 2011 05:02:17 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <20110221050217.GA29843@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 08:45:44PM -0800, Luis R. Rodriguez wrote:
> On Sun, Feb 20, 2011 at 8:14 PM, Greg KH <greg@kroah.com> wrote:
> > On Sun, Feb 20, 2011 at 08:00:38PM -0800, Luis R. Rodriguez wrote:
> >> On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrot=
e:
> >> > On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
> >> >> The original code was written in a funny way where every statement =
was
> >> >> part of else if blocks. =A0I broke them up into separate statements=
 by
> >> >> adding breaks on failure conditions.
> >> >>
> >> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> >>
> >> Can you guys please join IRC? ...
> >
> > That is not a requirement for kernel development, sorry.
>=20
> No, but I'm not asking you, I'm asking Vipin and other developers,
> using IRC is a good idea for internal coordination.

I agree, but that wasn't what you said here :)

> I see no way Vipin checking with Joe if he had his first set of
> patches ready. We need to do major cleanup on the driver *now* and
> these sort of miscommunication is just irritating. How do you
> recommend we coordinate cleanup with random patches being ACKed in the
> process without proper coordination?

You get Joe and Vipin to work together and agree with what to do.  You
don't email 4 other people and 2 mailing lists with a request to join
IRC :)

It's not like we don't do this kind of things all the time, and have
been for years, it just takes a willingness for the people involved to
work together.  Hopefully that is the case here.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
