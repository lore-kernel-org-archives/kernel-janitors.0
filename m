From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:14:58 +0000
Subject: [PATCH 01/27] drivers/net: fix sparse warning: use ANSI-style
Message-Id: <20081222191458.11807.57800.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:

  drivers/net/ne.c:932:24: warning: non-ANSI function declaration of function 'init_module'

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/ne.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ne.c b/drivers/net/ne.c
index cb02698..5c3e242 100644
--- a/drivers/net/ne.c
+++ b/drivers/net/ne.c
@@ -929,7 +929,7 @@ static void __init ne_add_devices(void)
 }
 
 #ifdef MODULE
-int __init init_module()
+int __init init_module(void)
 {
 	int retval;
 	ne_add_devices();

