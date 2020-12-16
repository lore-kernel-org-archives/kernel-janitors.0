From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:47:55 +0000
Subject: [PATCH] um: fix spelling mistake in Kconfig "privleges" -> "privileges"
Message-Id: <20201216114755.12461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Brendan Higgins <brendanhiggins@google.com>, linux-um@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/um/drivers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/drivers/Kconfig b/arch/um/drivers/Kconfig
index 2e7b8e0e7194..58e3ffc17b7d 100644
--- a/arch/um/drivers/Kconfig
+++ b/arch/um/drivers/Kconfig
@@ -323,7 +323,7 @@ config UML_NET_SLIRP
 	  frames.  In general, slirp allows the UML the same IP connectivity
 	  to the outside world that the host user is permitted, and unlike
 	  other transports, SLiRP works without the need of root level
-	  privleges, setuid binaries, or SLIP devices on the host.  This
+	  privileges, setuid binaries, or SLIP devices on the host.  This
 	  also means not every type of connection is possible, but most
 	  situations can be accommodated with carefully crafted slirp
 	  commands that can be passed along as part of the network device's
-- 
2.29.2
