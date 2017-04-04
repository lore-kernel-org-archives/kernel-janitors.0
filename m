From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 04 Apr 2017 11:10:07 +0000
Subject: [PATCH 0/3] SELinux: Fine-tuning for two function implementations
Message-Id: <5704e656-708a-b611-5611-70fc65dc67e8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 4 Apr 2017 13:02:03 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Return directly after a failed memory allocation in policydb_index()
  Return an error code only as a constant in sidtab_insert()
  Use an other error code for an input validation failure in sidtab_insert()

 security/selinux/ss/policydb.c | 15 +++++----------
 security/selinux/ss/sidtab.c   | 27 ++++++++++-----------------
 2 files changed, 15 insertions(+), 27 deletions(-)

-- 
2.12.2


