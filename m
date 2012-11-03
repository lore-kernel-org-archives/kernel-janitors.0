From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 20:30:17 +0000
Subject: [PATCH 0/8] drop if around WARN_ON
Message-Id: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches convert a conditional with a simple test expression and a
then branch that only calls WARN_ON(1) to just a call to WARN_ON, which
will test the condition.

// <smpl>
@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON(1);
|
- if (e) WARN_ON(1);
+ WARN_ON(e);
)// </smpl>

