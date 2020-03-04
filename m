From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 11:08:21 +0000
Subject: [PATCH] MAINTAINERS: adjust to kobject doc ReST conversion
Message-Id: <20200304110821.7243-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Sameer Rahmani <lxsameer@gnu.org>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 5fed00dcaca8 ("Documentation: kobject.txt has been moved to
core-api/kobject.rst") missed to adjust the entry in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: Documentation/kobject.txt

Adjust DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS entry in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Sameer, please ack.
Jonathan, pick pick this patch for doc-next.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d064049aad1b..998d56e61a41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5213,7 +5213,7 @@ M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 R:	"Rafael J. Wysocki" <rafael@kernel.org>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
 S:	Supported
-F:	Documentation/kobject.txt
+F:	Documentation/core-api/kobject.rst
 F:	drivers/base/
 F:	fs/debugfs/
 F:	fs/sysfs/
-- 
2.17.1
