From: "=?iso-8859-1?q?R=E9mi?= Denis-Courmont"
Date: Mon, 10 Jan 2011 14:08:43 +0000
Subject: Re: [patch] phonet: some signedness bugs
Message-Id: <201101101608.44403.remi.denis-courmont@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker> <201101100958.32549.remi.denis-courmont@nokia.com> <20110110140141.GA2721@bicker>
In-Reply-To: <20110110140141.GA2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ext Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

On Monday 10 January 2011 16:01:41 ext Dan Carpenter, you wrote:
> I would like to keep the change to phonet_proto_register() because the
> check in there isn't right and it's similar to phonet_proto_get().   We
> may as well keep phonet_proto_unregister() as well so it's symmetric.
> Let me know if you disagree and I'll redo it.

Sounds sensible to me.

--=20
R=E9mi Denis-Courmont
Nokia Devices R&D, Maemo Software, Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
