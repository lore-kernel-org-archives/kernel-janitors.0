From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 11:55:36 +0000
Subject: [PATCH] Coccinelle: Rename the script for a transformation of memory allocations
Message-Id: <6423882b-20df-61fd-d7c6-ac1bb4ec891d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ae67a02e-7257-c7e0-f4a1-bdf35a3bb2d0@users.sourceforge.net>
 <alpine.DEB.2.20.1801021528160.24055@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801021528160.24055@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Amitoj Kaur Chawla <amitoj1606@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 12:43:45 +0100

A script for the semantic patch language was extended
in a significant way.
An other file name is more appropriate then to indicate
the provided functionality. Thus rename this file.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ...kzalloc-simple.cocci => use zalloc functions with extra changes.cocci} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/coccinelle/api/alloc/{kzalloc-simple.cocci => use zalloc functions with extra changes.cocci} (100%)

diff --git a/scripts/coccinelle/api/alloc/kzalloc-simple.cocci b/scripts/coccinelle/api/alloc/use zalloc functions with extra changes.cocci
similarity index 100%
rename from scripts/coccinelle/api/alloc/kzalloc-simple.cocci
rename to scripts/coccinelle/api/alloc/use zalloc functions with extra changes.cocci
-- 
2.15.1


