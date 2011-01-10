From: "=?iso-8859-1?q?R=E9mi?= Denis-Courmont"
Date: Mon, 10 Jan 2011 07:58:32 +0000
Subject: Re: [patch] phonet: some signedness bugs
Message-Id: <201101100958.32549.remi.denis-courmont@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker>
In-Reply-To: <20110107203755.GB1959@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ext Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

On Friday 07 January 2011 22:37:55 ext Dan Carpenter, you wrote:
> Dan Rosenberg pointed out that there were some signed comparison bugs
> in the phonet protocol.

There are two ways to solve this: change *only* the proto_get function to u=
se=20
an unsigned parameter, or cast the protocol to unsigned in the comparison.

As David pointed out, your patch breaks the socket() callback prototype.

--=20
R=E9mi Denis-Courmont
Nokia Devices R&D, Maemo Software, Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
