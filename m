From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 15:07:17 +0000
Subject: [PATCH 0/3] NFS: Adjustments for three function implementations
Message-Id: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jul 2019 17:02:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use seq_putc() in nfs_show_stats()
  Replace 16 seq_printf() calls by seq_puts()
  Three function calls less

 fs/nfs/nfs4xdr.c |  5 +----
 fs/nfs/super.c   | 53 ++++++++++++++++++++++++------------------------
 2 files changed, 27 insertions(+), 31 deletions(-)

--
2.22.0
