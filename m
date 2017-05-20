From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:08:23 +0000
Subject: [PATCH 0/5] fsl_hypervisor: Adjustments for two function implementations
Message-Id: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:36:54 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Improve a size determination in fsl_hv_open()
  Delete an error message for a failed memory allocation in fsl_hv_open()
  Return the success indication only as a constant in fsl_hv_open()
  Use kcalloc() in ioctl_memcpy()
  Delete error messages for failed memory allocations in ioctl_memcpy()

 drivers/virt/fsl_hypervisor.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.13.0

