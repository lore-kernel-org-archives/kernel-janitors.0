From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 13:40:13 +0000
Subject: [PATCH 0/3] IMA: Fine-tuning for three function implementations
Message-Id: <416e6b01-7abb-d894-3bd6-d8bda05ed6b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 15:35:15 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use seq_putc() in ima_ascii_measurements_show()
  Combine two function calls into one in ima_policy_show()
  Replace nine seq_puts() calls by seq_putc()

 security/integrity/ima/ima_fs.c     |  4 ++--
 security/integrity/ima/ima_policy.c | 24 +++++++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.12.2

