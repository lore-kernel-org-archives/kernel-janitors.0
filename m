From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 23 Mar 2019 16:17:46 +0000
Subject: Re: [v5] coccinelle: semantic code search for missing put_device()
Message-Id: <1691b160-5558-d4c3-afed-5773e115c5aa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <CAK7LNASzd=bL1H34w-E_UD9x6w2=ObyS+EPDZ_jrvfV+ncw-yA@mail.gmail.com>
In-Reply-To: <CAK7LNASzd=bL1H34w-E_UD9x6w2=ObyS+EPDZ_jrvfV+ncw-yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> Applied to linux-kbuild.

A questionable development version was integrated for this SmPL script.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
scripts/coccinelle/free/put_device.cocci?id=DA9cfb87a44da61f2403c4312916bef=
cb6b6d7e8

https://lore.kernel.org/cocci/201902191014156680299@zte.com.cn/


Now I am curious on how such a source code analysis approach will be
improved further.
Which changes will get the desired acceptance?

https://lore.kernel.org/patchwork/patch/1053979/
https://lore.kernel.org/lkml/1553321671-27749-1-git-send-email-wen.yang99@z=
te.com.cn/
https://systeme.lip6.fr/pipermail/cocci/2019-March/005679.html

Regards,
Markus
