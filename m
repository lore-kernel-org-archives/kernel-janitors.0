From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 Jan 2018 14:25:54 +0000
Subject: =?UTF-8?Q?Re:_Rename_the_SmPL_script_=e2=80=9ckzalloc-=e2=80=a6.coc?= =?UTF-8?B?Y2nigJ0/?=
Message-Id: <ae67a02e-7257-c7e0-f4a1-bdf35a3bb2d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
In-Reply-To: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

A script for the semantic patch language was extended in significant ways.

[PATCH v2] Coccinelle: kzalloc-simple: Add “all” zero allocating functions
https://lkml.org/lkml/2017/12/26/182
https://patchwork.kernel.org/patch/10133277/
https://lkml.kernel.org/r/<1514324410-14561-1-git-send-email-himanshujha199640@gmail.com>
https://systeme.lip6.fr/pipermail/cocci/2017-December/004783.html

Now I find that it became more advanced than the previous version.
How do you think about to update also the corresponding file name
(instead of keeping the word “simple” there)?

Regards,
Markus
