From: Linus Walleij <linus.ml.walleij@gmail.com>
Date: Sat, 17 Jul 2010 10:00:38 +0000
Subject: Re: [PATCH 02/15] arm/mach-u300: check kmalloc result
Message-Id: <AANLkTinb-TcOBX69tjR1Z3OdYmNvDwHMl_-C-39eWyCu@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279296767-24823-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279296767-24823-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

2010/7/16 Kulikov Vasiliy <segooon@gmail.com>:

> =A0arch/arm/mach-u300/dummyspichip.c | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)

NACK I have recently submitted two patches to move this test chip to
drivers/spi, please base your fixes work on top of those patches
instead, and make sure to mail them to Grant Likely and the
spi-devel-general list.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
