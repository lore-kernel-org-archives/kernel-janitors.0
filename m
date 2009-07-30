From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Date: Thu, 30 Jul 2009 20:19:31 +0000
Subject: Re: [PATCH 3/5] mm: Add kmalloc NULL tests
Message-Id: <20090730201931.GA12965@logfs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301608350.8734@ask.diku.dk> <20090730153658.GA22986@cmpxchg.org> <20090730183558.GA11763@logfs.org> <20090730191213.GA9471@cmpxchg.org>
In-Reply-To: <20090730191213.GA9471@cmpxchg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Julia Lawall <julia@diku.dk>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 30 July 2009 21:12:14 +0200, Johannes Weiner wrote:
>=20
> You will probably have a hard time establishing a userspace mapping
> before slab is initializied :)

Agreed.

J=C3=B6rn

--=20
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
