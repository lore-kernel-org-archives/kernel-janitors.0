From: Timur Tabi <timur@freescale.com>
Date: Sat, 01 Aug 2009 12:25:24 +0000
Subject: Re: [PATCH 1/10] arch/powerpc/sysdev/qe_lib: introduce missing kfree
Message-Id: <ed82fe3e0908010525w56e93f6cl1d4c1bcc84d9e014@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908011052290.23408@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908011052290.23408@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 1, 2009 at 3:52 AM, Julia Lawall<julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Error handling code following a kzalloc should free the allocated data.
>

...

>
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
> =A0arch/powerpc/sysdev/qe_lib/qe_ic.c =A0| =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)

Acked-by: Timur Tabi <timur@freescale.com>

--=20
Timur Tabi
Linux kernel developer at Freescale
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
