From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 21:08:21 +0000
Subject: [PATCH 0/4 v2] improve platform_get_irq.cocci
Message-Id: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@inria.fr>, Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr

Various cleanups in platform_get_irq.cocci to give more useful
patches and to give a few more results.

v2: fix some interchanged From's and To's
