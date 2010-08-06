From: Namhyung Kim <namhyung@gmail.com>
Date: Fri, 06 Aug 2010 13:46:11 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <1281102371.1655.24.camel@leonhard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
	 <4C5C04D8.1080103@kernel.org> <1281099197.1655.11.camel@leonhard>
	 <4C5C06A6.7070206@kernel.org> <1281101014.1655.20.camel@leonhard>
	 <4C5C1011.6080209@kernel.org>
In-Reply-To: <4C5C1011.6080209@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2010-08-06 (=EA=B8=88), 15:37 +0200, Tejun Heo:
> Hello,
>=20

Hi,

> On 08/06/2010 03:23 PM, Namhyung Kim wrote:
> > Sure. :-)
> > Although I'm not sure that it is really needed, if so I'll do that.
>=20
> Well, the whole __percpu markup thing is to detect misuse of percpu
> pointers.  I think it would definitely be better to have the sanity
> check for UP code too.  It's not like it's gonna cost any runtime
> overhead and all the needed pieces are already there.
>=20
> Thanks.
>=20

I see. Thanks for the comments.

--=20
Regards,
Namhyung Kim


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
