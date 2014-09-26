From: Michal Marek <mmarek@suse.cz>
Date: Fri, 26 Sep 2014 11:43:10 +0000
Subject: Re: [PATCH v2] coccinelle: misc: semantic patch to delete overly complex return code processing
Message-Id: <20140926114309.GA31096@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408772085-28818-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408772085-28818-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

On Sat, Aug 23, 2014 at 07:34:45AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> This semantic patch simplifies cases where the effect of the processing of
> a function call's return code is just to return the result of the function
> directly.  It may also delete a local return flag variable, if this is no
> longer used.
>=20
> This was proposed by Uwe Kleine-K=F6nig.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc, thanks.

Michal
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
