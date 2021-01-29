From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Jan 2021 04:08:49 +0000
Subject: [PATCH] platform/x86: thinkpad_acpi: rectify length of title underline
Message-Id: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nitin Joshi <njoshi1@lenovo.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit d7cbe2773aed ("platform/x86: thinkpad_acpi: set keyboard language")
adds information on keyboard setting to the thinkpad documentation, but
made the subsection title underline too short.

Hence, make htmldocs warns:

  Documentation/admin-guide/laptops/thinkpad-acpi.rst:1472: \
    WARNING: Title underline too short.

Rectify length of subsection title underline.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210128

Nitin, please ack.

Hans, please pick this minor fixup for your platform/x86 -next tree.

 Documentation/admin-guide/laptops/thinkpad-acpi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index b1188f05a99a..0e4c5bb7fb70 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1469,7 +1469,7 @@ Sysfs notes
 
 
 Setting keyboard language
--------------------
+-------------------------
 
 sysfs: keyboard_lang
 
-- 
2.17.1
