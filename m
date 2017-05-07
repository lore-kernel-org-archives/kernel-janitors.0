From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 12:01:00 +0000
Subject: [PATCH 0/2] apparmorfs: Fine-tuning for three function implementations
Message-Id: <b58df574-97f1-dbc5-2198-fe4734f24b8e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 13:58:08 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Combine two function calls into one in aa_fs_seq_raw_abi_show()
  Use seq_putc() in two functions

 security/apparmor/apparmorfs.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.12.2

