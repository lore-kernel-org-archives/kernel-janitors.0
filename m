From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 27 Dec 2008 21:38:44 +0000
Subject: [PATCH] Makefile: disable sparse warning "returning void-valued expression"
Message-Id: <4956a360.0b38560a.3c6c.ffff9113@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	    <20081222191517.11807.20718.stgit@vmbox.hanneseder.net>
	    <20081225.161740.10052019.davem@davemloft.net>
	    <20081226115921.bb094c58.rdunlap@xenotime.net>
	    <49567dd3.0b38560a.3c6c.0511@mx.google.com>
	    <20081227192012.GB10592@uranus.ravnborg.org>
In-Reply-To: <20081227192012.GB10592@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@xenotime.net>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The sparse warning -Wreturn-void ("returning void-valued expression")
is off by default, but it is enabled with -Wall, so add
-Wno-return-void to CHECKFLAGS to disable it.

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 64f14aa..a5b5e8d 100644
--- a/Makefile
+++ b/Makefile
@@ -321,7 +321,8 @@ KALLSYMS	= scripts/kallsyms
 PERL		= perl
 CHECK		= sparse
 
-CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise $(CF)
+CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
+		  -Wbitwise -Wno-return-void $(CF)
 MODFLAGS	= -DMODULE
 CFLAGS_MODULE   = $(MODFLAGS)
 AFLAGS_MODULE   = $(MODFLAGS)
