From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 08 Jun 2015 12:53:17 +0000
Subject: [PATCH 0/3] Drop dead code in lov_finish_set
Message-Id: <1433768000-30964-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Lov_finish_set in lov_request.c considers freeing various things that
have never been initialized.  Drop this and some dependent unnecessary
code.

 drivers/staging/lustre/lustre/lov/lov_internal.h | 37 ------------------------
 drivers/staging/lustre/lustre/lov/lov_request.c  | 10 -------
 2 files changed, 47 deletions(-)
