From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 09:30:09 +0000
Subject: [PATCH 0/3] ima_fs: Fine-tuning for ima_write_policy()
Message-Id: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ima-devel@lists.sourceforge.net, linux-ima-user@lists.sourceforge.net, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <james.l.morris@oracle.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 10:20:30 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  One check less after error detection
  Reorder input parameter validation
  Move three error code assignments

 security/integrity/ima/ima_fs.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.11.0

