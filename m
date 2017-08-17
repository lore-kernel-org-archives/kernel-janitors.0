From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 14:32:10 +0000
Subject: [PATCH 0/2] lockd: Adjustments for some function implementations
Message-Id: <e53b2d3a-239a-268c-5674-3c50b02c966f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Benjamin Coddington <bcodding@redhat.com>, Christoph Hellwig <hch@lst.de>, Colin Ian King <colin.king@canonical.com>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>, Trond Myklebust <trond.myklebust@primarydata.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 16:17:18 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in reclaimer()
  Adjust 61 checks for null pointers

 fs/lockd/clnt4xdr.c | 12 ++++++------
 fs/lockd/clntlock.c | 16 ++++++----------
 fs/lockd/clntproc.c | 12 ++++++------
 fs/lockd/clntxdr.c  | 12 ++++++------
 fs/lockd/host.c     | 22 +++++++++++-----------
 fs/lockd/mon.c      | 16 ++++++++--------
 fs/lockd/svc.c      |  4 ++--
 fs/lockd/svc4proc.c |  6 +++---
 fs/lockd/svclock.c  | 14 +++++++-------
 fs/lockd/svcproc.c  |  6 +++---
 fs/lockd/svcshare.c |  2 +-
 fs/lockd/svcsubs.c  |  3 +--
 12 files changed, 60 insertions(+), 65 deletions(-)

-- 
2.14.0

