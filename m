From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 06 May 2020 20:29:06 +0000
Subject: [PATCH] MAINTAINERS: put DYNAMIC INTERRUPT MODERATION in proper order
Message-Id: <20200506202906.23297-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 9b038086f06b ("docs: networking: convert DIM to RST") added a new
file entry to DYNAMIC INTERRUPT MODERATION to the end, and not following
alphabetical order.

So, ./scripts/checkpatch.pl -f MAINTAINERS complains:

  WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic
  order
  #5966: FILE: MAINTAINERS:5966:
  +F:      lib/dim/
  +F:      Documentation/networking/net_dim.rst

Reorder the file entries to keep MAINTAINERS nicely ordered.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Jakub, please pick this minor non-urgent patch.

applies cleanly on next-20200505

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b103ff039077..92dced585e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5957,9 +5957,9 @@ F:	lib/dynamic_debug.c
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@mellanox.com>
 S:	Maintained
+F:	Documentation/networking/net_dim.rst
 F:	include/linux/dim.h
 F:	lib/dim/
-F:	Documentation/networking/net_dim.rst
 
 DZ DECSTATION DZ11 SERIAL DRIVER
 M:	"Maciej W. Rozycki" <macro@linux-mips.org>
-- 
2.17.1
