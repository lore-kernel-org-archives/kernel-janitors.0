From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 16:52:26 +0000
Subject: [PATCH 0/8] PowerPC-NVRAM: Fine-tuning for some function implementations
Message-Id: <53545d97-6ed5-ff17-384f-82e72b3592f9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Daniel Axtens <dja@axtens.net>, Geliang Tang <geliangtang@163.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 17:41:23 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  Return directly after a failed parameter validation in dev_nvram_write()
  Return directly after a failed kmalloc() in dev_nvram_write()
  Move an assignment for the variable "ret" in dev_nvram_write()
  Return directly after a failed parameter validation in dev_nvram_read()
  Return directly after a failed kmalloc() in dev_nvram_read()
  Delete three error messages for a failed memory allocation
  Improve size determinations in three functions
  Move an assignment for the variable "err" in nvram_scan_partitions()

 arch/powerpc/kernel/nvram_64.c | 63 +++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 41 deletions(-)

-- 
2.11.0

