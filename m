From: matt mooney <mfmooney@gmail.com>
Date: Thu, 23 Sep 2010 19:57:35 +0000
Subject: Re: [PATCH V2] git-send-email.perl: Add --to-cmd
Message-Id: <AANLkTin7KKqtvJrioiAspGiN8-Gpe+gzd0eC48LaNa7P@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTinsM5jdU194FR8L3hTvBXk0Tr_oV2E5752NOUpq@mail.gmail.com>
	<AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
	<1285227413.7286.47.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
	<20100923090931.GA29789@albatros>
	<20100923120024.GA26715@albatros>
	<1285253867.31572.13.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231757090.11585@ask.diku.dk>
	<1285262237.31572.18.camel@Joe-Laptop>
	<AANLkTin_Y8w4ujNGTqGJPNDNfYz7hcjBVLcOG0emBjYn@mail.gmail.com>
	<1285263993.31572.25.camel@Joe-Laptop>
	<AANLkTinCx=+n6bMZw4tQqrQ7WC1o_aeGG_n_PxywTyb8@mail.gmail.com>
	<1285267520.31572.34.camel@Joe-Laptop>
In-Reply-To: <1285267520.31572.34.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: =?ISO-8859-1?Q?=C6var_Arnfj=F6r=F0?= <avarab@gmail.com>, Julia Lawall <julia@diku.dk>, git <git@vger.kernel.org>, Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Thu, Sep 23, 2010 at 11:45 AM, Joe Perches <joe@perches.com> wrote:
> Add the ability to use a command line --to-cmd=3Dcmd
> to create the list of "To:" addresses.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0Documentation/git-send-email.txt | =A0 =A08 +++++++-
> =A0git-send-email.perl =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 25 ++++++++++++++=
+++++++++--
> =A0t/t9001-send-email.sh =A0 =A0 =A0 =A0 =A0 =A0| =A0 18 ++++++++++++++++=
++
> =A03 files changed, 48 insertions(+), 3 deletions(-)

Looks reasonable to me. Nice work getting on this quickly ;)

-mfm

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
