From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:31 +0000
Subject: [PATCH 9/15] clk: don't export static symbol
Message-Id: <1426092997-30605-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Turquette <mturquette@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, daniel@iogearbox.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk.c |    1 -
 1 file changed, 1 deletion(-)

diff -u -p a/drivers/clk/clk.c b/drivers/clk/clk.c
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1350,7 +1350,6 @@ static unsigned long clk_core_get_rate(s
 
 	return rate;
 }
-EXPORT_SYMBOL_GPL(clk_core_get_rate);
 
 /**
  * clk_get_rate - return the rate of clk

