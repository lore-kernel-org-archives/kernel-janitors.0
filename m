From: "=?iso-8859-1?q?R=E9mi?= Denis-Courmont"
Date: Mon, 10 Jan 2011 14:12:03 +0000
Subject: Re: [patch v2] phonet: some signedness bugs
Message-Id: <201101101612.04296.remi.denis-courmont@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker> <201101100958.32549.remi.denis-courmont@nokia.com> <20110110140658.GB2721@bicker>
In-Reply-To: <20110110140658.GB2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ext Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

On Monday 10 January 2011 16:06:58 ext Dan Carpenter, you wrote:
> Dan Rosenberg pointed out that there were some signed comparison bugs
> in the phonet protocol.
>=20
> http://marc.info/?l=3Dfull-disclosure&m=129424528425330&w=3D2
>=20
> The problem is that we check for array overflows but "protocol" is
> signed and we don't check for array underflows.  If you have already
> have CAP_SYS_ADMIN then you could use the bugs to get root, or someone
> could cause an oops by mistake.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: R=E9mi Denis-Courmont <remi.denis-courmont@nokia.com>


--=20
R=E9mi Denis-Courmont
Nokia Devices R&D, Maemo Software, Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
