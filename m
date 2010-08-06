From: Namhyung Kim <namhyung@gmail.com>
Date: Fri, 06 Aug 2010 13:23:34 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <1281101014.1655.20.camel@leonhard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
	 <4C5C04D8.1080103@kernel.org> <1281099197.1655.11.camel@leonhard>
	 <4C5C06A6.7070206@kernel.org>
In-Reply-To: <4C5C06A6.7070206@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2010-08-06 (=EA=B8=88), 14:57 +0200, Tejun Heo:

> Ah, I see.  Then, the right thing to do is to add proper checking and
> markups to UP accessors matching the SMP ones.
> ie. __verify_pcpu_ptr() verification followed by __kernel __force
> casting.  Are you interested in doing it?
>=20
> Thanks.
>=20

Sure. :-)
Although I'm not sure that it is really needed, if so I'll do that.

--=20
Regards,
Namhyung Kim


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
