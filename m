From: Dan Carpenter <error27@gmail.com>
Date: Mon, 10 Jan 2011 14:01:41 +0000
Subject: Re: [patch] phonet: some signedness bugs
Message-Id: <20110110140141.GA2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker>
 <201101100958.32549.remi.denis-courmont@nokia.com>
In-Reply-To: <201101100958.32549.remi.denis-courmont@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis-courmont@nokia.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

On Mon, Jan 10, 2011 at 09:58:32AM +0200, R=E9mi Denis-Courmont wrote:
> On Friday 07 January 2011 22:37:55 ext Dan Carpenter, you wrote:
> > Dan Rosenberg pointed out that there were some signed comparison bugs
> > in the phonet protocol.
>=20
> There are two ways to solve this: change *only* the proto_get function to=
 use=20
> an unsigned parameter, or cast the protocol to unsigned in the comparison.
>=20
> As David pointed out, your patch breaks the socket() callback prototype.
>=20

Yes.  I really appologize for that.  I'll send version 2 with that create()
change dropped.  It's not needed.

I would like to keep the change to phonet_proto_register() because the
check in there isn't right and it's similar to phonet_proto_get().   We
may as well keep phonet_proto_unregister() as well so it's symmetric.
Let me know if you disagree and I'll redo it.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
