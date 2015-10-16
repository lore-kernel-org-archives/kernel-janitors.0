From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 16 Oct 2015 20:09:10 +0000
Subject: Re: [PATCH] powerpc/prom: Avoid reference to potentially freed memory
Message-Id: <mvrlh7$mjr$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444976055-19148-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444989750.12954.4.camel@ellerman.id.au>
In-Reply-To: <1444989750.12954.4.camel@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 16/10/2015 12:02, Michael Ellerman a =C3=A9crit :
> As the kbuild robot detected you have left an extra "}" here.
>
> I don't mind too much if you send patches that aren't compile tested, but=
 you
> might save yourself some time by compiling them.

Sorry about it, and thanks for your patience.
IMHO, this should never happen and patches should be at least=20
compile-tested.

I will be more careful and compile-test any new patch I submit.

CJ

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
