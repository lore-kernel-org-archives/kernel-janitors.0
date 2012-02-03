From: Roland Dreier <roland@kernel.org>
Date: Fri, 03 Feb 2012 17:08:57 +0000
Subject: Re: [patch 2/3] ib_srpt: checking NULL instead of ERR_PTR
Message-Id: <CAL1RGDU0HkrS_ME12H6j43e=Fkn=C9Ms64mXNjxf4_dS_PV7EQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111104182732.GH5796@elgon.mountain> <1320443697.5859.171.camel@haakon2.linux-iscsi.org>
 <CA+_b7DK-=ORJQ20aHE_aVgEud4vAPQG_sskOeMqftabzun0h+A@mail.gmail.com>
In-Reply-To: <CA+_b7DK-=ORJQ20aHE_aVgEud4vAPQG_sskOeMqftabzun0h+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nab-4mckEHfoRW3KI0RCH6AXYZqQE7yCjDx5@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, target-devel <target-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bart Van Assche <bart.vanassche-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Fri, Feb 3, 2012 at 5:01 AM, Dan Carpenter <error27@gmail.com> wrote:
> All the others seem to fixed up. =A0It's just these two place which need
> to be fixed still. =A0My patch still applies fine with a little fuzz. =A0=
;)

I have a few pending srpt patches, coincidentally including one that hits
very near yours leading to a trivial conflict.  So I just merged yours into
your tree as well and I guess I'll send to Linus shortly.

Thanks,
  Roland
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
