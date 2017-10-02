From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Oct 2017 17:56:56 +0000
Subject: [PATCH 0/6] ARM-S3C24xx: Adjustments for four function implementations
Message-Id: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:50:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Delete an error message for a failed memory allocation in s3c2410_iotiming_get()
  Improve a size determination in s3c2410_iotiming_get()
  s3c2410: Fix a typo in a comment line
  Delete an error message for a failed memory allocation in s3c2412_iotiming_get()
  Improve a size determination in s3c2412_iotiming_get()
  s3c2412: Fix a typo in a comment line

 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 8 +++-----
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.14.2

