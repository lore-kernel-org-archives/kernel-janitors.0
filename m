From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 20 Nov 2019 14:00:44 +0000
Subject: [RESEND PATCH] qnx6: Fix Kconfig indentation
Message-Id: <20191120140044.19003-1-krzk@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 fs/qnx6/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/qnx6/Kconfig b/fs/qnx6/Kconfig
index 6a9d6bce1586..5ef679e51ba1 100644
--- a/fs/qnx6/Kconfig
+++ b/fs/qnx6/Kconfig
@@ -7,7 +7,7 @@ config QNX6FS_FS
 	  QNX 6 (also called QNX RTP).
 	  Further information is available at <http://www.qnx.com/>.
 	  Say Y if you intend to mount QNX hard disks or floppies formatted
-          with a mkqnx6fs.
+	  with a mkqnx6fs.
 	  However, keep in mind that this currently is a readonly driver!
 
 	  To compile this file system support as a module, choose M here: the
-- 
2.17.1
