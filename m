From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Dec 2015 14:30:19 +0000
Subject: [PATCH 0/7] iSCSI-target: Fine-tuning for three function implementations
Message-Id: <566C2F7B.6030704@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Dec 2015 15:25:20 +0100

Some update suggestions were taken into account from static
source code analysis.

Markus Elfring (7):
  Use a variable initialisation in iscsi_set_default_param() directly
  Less checks in iscsi_set_default_param() after error detection
  Delete an unnecessary variable initialisation in iscsi_create_default_params()
  Make a variable initialisation a bit more obvious in iscsi_create_default_params()
  Rename a jump label in iscsi_create_default_params()
  Delete unnecessary variable initialisations in iscsi_check_valuelist_for_support()
  Make two variable initialisations a bit more obvious in iscsi_check_valuelist_for_support()

 drivers/target/iscsi/iscsi_target_parameters.c | 100 ++++++++++++-------------
 1 file changed, 47 insertions(+), 53 deletions(-)

-- 
2.6.3

