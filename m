From: "=?iso-8859-1?q?R=E9mi?= Denis-Courmont"
Date: Thu, 13 Jan 2011 12:32:57 +0000
Subject: Re: [patch v2] phonet: some signedness bugs
Message-Id: <201101131432.58059.remi.denis-courmont@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker> <20110110140658.GB2721@bicker> <20110110.160620.133889003.davem@davemloft.net>
In-Reply-To: <20110110.160620.133889003.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: error27@gmail.com, dan.j.rosenberg@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tuesday 11 January 2011 02:06:20 ext David Miller, you wrote:
> From: Dan Carpenter <error27@gmail.com>
> Date: Mon, 10 Jan 2011 17:06:58 +0300
>=20
> > Dan Rosenberg pointed out that there were some signed comparison bugs
> > in the phonet protocol.
> >=20
> > http://marc.info/?l=3Dfull-disclosure&m=129424528425330&w=3D2
> >=20
> > The problem is that we check for array overflows but "protocol" is
> > signed and we don't check for array underflows.  If you have already
> > have CAP_SYS_ADMIN then you could use the bugs to get root, or someone
> > could cause an oops by mistake.
> >=20
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> Applied.

Shouldn't this be sent to stable trees?

--=20
R=E9mi Denis-Courmont
Nokia Devices R&D, Maemo Software, Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
