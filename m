From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 07 Dec 2019 18:28:39 +0000
Subject: [PATCH] MAINTAINERS: fix style in RESET CONTROLLER FRAMEWORK
Message-Id: <20191207182839.14482-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joe Perches <joe@perches.com>, kernel@pengutronix.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 37859277374d ("MAINTAINERS: add reset controller framework
keywords") slips in some formatting with spaces instead of tabs, which
./scripts/checkpatch.pl -f MAINTAINERS complains about:

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #14047: FILE: MAINTAINERS:14047:
  +K:      \b(?:devm_|of_)?reset_control(?:ler_[a-z]+|_[a-z_]+)?\b

Fixes: 37859277374d ("MAINTAINERS: add reset controller framework keywords")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (eea2d5da29e3) and next-20191207

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f282e5cbc40e..0b5cb337f78c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14044,7 +14044,7 @@ F:	include/dt-bindings/reset/
 F:	include/linux/reset.h
 F:	include/linux/reset/
 F:	include/linux/reset-controller.h
-K:      \b(?:devm_|of_)?reset_control(?:ler_[a-z]+|_[a-z_]+)?\b
+K:	\b(?:devm_|of_)?reset_control(?:ler_[a-z]+|_[a-z_]+)?\b
 
 RESTARTABLE SEQUENCES SUPPORT
 M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-- 
2.17.1
