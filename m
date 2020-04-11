From: Joe Perches <joe@perches.com>
Date: Sat, 11 Apr 2020 15:46:49 +0000
Subject: Re: [PATCH] usb: phy: jz4770: Add a missing '\n' in a log message
Message-Id: <d42889be3ae1c77c6ca33d9dbd87ab46c749cfff.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411063811.6767-1-christophe.jaillet@wanadoo.fr>
         <ZQKM8Q.561QQF8CXZTU3@crapouillou.net>
In-Reply-To: <ZQKM8Q.561QQF8CXZTU3@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Paul Cercueil <paul@crapouillou.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2020-04-11 at 15:13 +0200, Paul Cercueil wrote:
> Hi Christophe,
>=20
> Le sam. 11 avril 2020 =E0 8:38, Christophe JAILLET=20
> <christophe.jaillet@wanadoo.fr> a =E9crit :
> > Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
>=20
> Is that so?
> From what I could see these macros add the \n themselves if needed.

Not so.

> So the \n were omitted on purpose.

Just a trivial oversight really.

AFAIK: It's an issue _only_ in two cases:

p another process emits a printk with KERN_CONT (or pr_cont)
  that might extend this message in the log on the same line.

o this message wukk not be emitted into the log until another
  message arrives
