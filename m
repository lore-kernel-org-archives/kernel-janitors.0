From: Domen Puncer <domen@coderock.org>
Date: Wed, 25 May 2005 12:49:39 +0000
Subject: Re: [KJ] [PATCH] remove sti/cli esp.c
Message-Id: <20050525124939.GG3851@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <IGJHIS$6DD48F908E17011C2DE59A4BEC27710E@tiscali.fr>
In-Reply-To: <IGJHIS$6DD48F908E17011C2DE59A4BEC27710E@tiscali.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Second half of december there were some discussions about esp sti/cli
on this mailing list, be sure to check what the issues were.

On 15/05/05 18:23 +0200, david.chosrova@libertysurf.fr wrote:
>  description: remove sti/cli and friends, use accepted
> locking functions.

^M?

>=20
>=20
>=20
> signed-off-by : david chosrova <david.chosrova@libertsur.fr>

No shift key? ;-)

> ************************ ADSL JUSQU'A 8 MEGA + 3 MOIS DE TELEPHONE GRATUI=
T ************************
> L'ultra haut d=E9bit =E0 15EUR/mois seulement ! Et vous t=E9l=E9phonez gr=
atuitement en France vers les postes fixes,
> hors num=E9ros sp=E9ciaux pendant 3 mois.
> Pour profiter de cette offre exceptionnelle, cliquez ici : http://registe=
r.tiscali.fr/adsl/  (voir conditions sur le site)

I'm almost sure, we don't want this propagated into SCM's log.

Patches are base64 which means people can't comment on them without
(usualy too much) trouble, inline them, or attach as plain text.
You could give patch-tester@coderock.org a try (it's alpha state, but
should still be useful).

Also, http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt and
http://linux.yyz.us/patch-format.html contain some more info
on what form to send patches in.


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
