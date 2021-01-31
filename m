From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 31 Jan 2021 07:36:04 +0000
Subject: [PATCH for -next] docs: drop removed pti_intel_mid from driver-api index
Message-Id: <20210131073604.7643-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 8ba59e9dee31 ("misc: pti: Remove driver for deprecated platform")
removed ./Documentation/driver-api/pti_intel_mid.rst, but missed to remove
it from the index at ./Documentation/driver-api/index.rst.

Hence, make htmldocs warns:

  WARNING: toctree contains reference to nonexisting document
    'driver-api/pti_intel_mid'

Remove pti_intel_mid from driver-api index.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210129

Greg, please pick this minor fixup on top of the commit above.

 Documentation/driver-api/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 9d9af54d68c5..66c4c01eeec6 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -93,7 +93,6 @@ available subsections can be seen below.
    pps
    ptp
    phy/index
-   pti_intel_mid
    pwm
    pldmfw/index
    rfkill
-- 
2.17.1
