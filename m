From: Andreas Schwab <schwab@suse.de>
Date: Tue, 30 Dec 2008 10:43:22 +0000
Subject: Re: Many warnings from our userspace headers
Message-Id: <jeiqp2j645.fsf@sykes.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081230103348.GA363@uranus.ravnborg.org>
In-Reply-To: <20081230103348.GA363@uranus.ravnborg.org> (Sam Ravnborg's
	message of "Tue, 30 Dec 2008 11:33:48 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

Sam Ravnborg <sam@ravnborg.org> writes:

> /home/sam/kernel/knext.git/usr/include/linux/acct.h:62: leaks CONFIG_M68K=
 to userspace where it is not valid

IMHO this is a false positive, since it is protected by __KERNEL__ in
the same expression.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
