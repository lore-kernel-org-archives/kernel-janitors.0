From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 15:26:58 +0000
Subject: [PATCH] hwmon: pmbus: correct title underline length
Message-Id: <20201207152658.32444-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit b722d7b9e4da ("hwmon: (pmbus) Driver for Delta power supplies
Q54SJ108A2") provides new documentation for DELTA Q54SJ108A2NC* drivers,
but the title underline was too short.

make htmldocs warns:

  Documentation/hwmon/q54sj108a2.rst:4: WARNING: Title underline too short.

Adjust the title underline to the correct length.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20201207 and the hwmon -next tree

Guenter, Jean, please pick this minor doc fix on your -next tree.

 Documentation/hwmon/q54sj108a2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/q54sj108a2.rst b/Documentation/hwmon/q54sj108a2.rst
index fabce671985a..035312d25c34 100644
--- a/Documentation/hwmon/q54sj108a2.rst
+++ b/Documentation/hwmon/q54sj108a2.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
 
 Kernel driver q54sj108a2
-==========+============
 
 Supported chips:
 
-- 
2.17.1
