From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 16 Dec 2005 14:25:58 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in media/video/hexium_gemini.c
Message-Id: <20051216142558.GA7937@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60780156437867605=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134733947.8536.2.camel@alice>
In-Reply-To: <1134733947.8536.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============60780156437867605==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-12-16 at 12:52:26 +0100, Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
> this fixes another icc warning. index is unsigned and only
> used as an array index, so it should be safe to remove
> the comparison.

If you plan to send in lots of these patches, try to split them up by
subsystem (here e.g. all in drivers/media or drivers/media/video) as
they're relatively trivial and do not change a lot of code. It will make
the lives of maintainers much easier. ;-)

Cheers, Tobias

--===============60780156437867605==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60780156437867605==--
