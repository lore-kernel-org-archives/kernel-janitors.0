From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 19:20:21 +0000
Subject: [PATCH 0/3] pstore: Adjustments for some function implementations
Message-Id: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 21:06:54 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete six error messages for a failed memory allocation
  Improve a size determination in three functions
  Adjust two checks for null pointers

 fs/pstore/ram.c      | 11 +++--------
 fs/pstore/ram_core.c | 21 +++++++--------------
 2 files changed, 10 insertions(+), 22 deletions(-)

-- 
2.14.0

