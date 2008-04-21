From: David Brownell <david-b@pacbell.net>
Date: Mon, 21 Apr 2008 19:26:10 +0000
Subject: Re: ehci tests unsigned variables against 0
Message-Id: <200804211226.10720.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080419145812.GN20637@parisc-linux.org>
In-Reply-To: <20080419145812.GN20637@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Saturday 19 April 2008, Matthew Wilcox wrote:
> These tests will never trigger and should simply be removed. =A0Linux's
> kernel snprintf function conforms to C99 and never returns 0.

I think you mean "never returns negative" ?

-ENOPATCH

... although if that's the case, I'd think that the *snprintf()
signatures are incorrect:  they should return "unsigned" not "int".
If that were done, I think even GCC could be made to report such
issues; one wouldn't need less-common tools like coccinelle.

(What I've seen of coccinelle makes me glad it's being applied to
the kernel sources, by the way.)

- Dave
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
