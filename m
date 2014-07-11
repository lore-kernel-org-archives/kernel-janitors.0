From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 11 Jul 2014 10:13:23 +0000
Subject: [PATCH] drivers/staging/comedi/drivers/ni_atmio16d.c: remove pointless condition
Message-Id: <1405073603-21468-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1316068759-3460-1-git-send-email-cpeterso@cpeterso.com>
In-Reply-To: <1316068759-3460-1-git-send-email-cpeterso@cpeterso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org
Cc: gregkh@linuxfoundation.org, hsweeten@visionengravers.com, abbotti@mev.co.uk, dcb314@hotmail.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

The issue was discovered with static analysis and has two instances in
this file. The code looks like this
if (x < 65536000) {
	...
} else if (x < 655360000) {
	...
} else if (x <= 0xffffffff /* 6553600000 */) {
	...
} else if (x <= 0xffffffff /* 65536000000 */) {
	...
}

The meaning of this block is to select appropriate clock frequency for
interval timer basing on "x", which is amount of time.

Notes:
1. That last condition matches previous one - that's the issue.
2. Decimal numbers in comments don't match hex numbers in expressions.
But in first case the numbers have same order, while in the second case
the hex number is the same, and the decimal one is 10 times bigger.
3. Actually type of "x" is "unsigned int", so its exact upper limit is
not obviously known.
4. There's no "else" block.

So it makes sense to make an "else" block from last "else if" case. The
code inside the block seems correct for such usage.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?idy871
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/comedi/drivers/ni_atmio16d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_atmio16d.c b/drivers/staging/comedi/drivers/ni_atmio16d.c
index 6ad27f5..895b56d 100644
--- a/drivers/staging/comedi/drivers/ni_atmio16d.c
+++ b/drivers/staging/comedi/drivers/ni_atmio16d.c
@@ -338,7 +338,7 @@ static int atmio16d_ai_cmd(struct comedi_device *dev,
 	} else if (cmd->convert_arg <= 0xffffffff /* 6553600000 */) {
 		base_clock = CLOCK_10_KHZ;
 		timer = cmd->convert_arg / 100000;
-	} else if (cmd->convert_arg <= 0xffffffff /* 65536000000 */) {
+	} else {
 		base_clock = CLOCK_1_KHZ;
 		timer = cmd->convert_arg / 1000000;
 	}
@@ -406,7 +406,7 @@ static int atmio16d_ai_cmd(struct comedi_device *dev,
 		} else if (cmd->scan_begin_arg < 0xffffffff /* 6553600000 */) {
 			base_clock = CLOCK_10_KHZ;
 			timer = cmd->scan_begin_arg / 100000;
-		} else if (cmd->scan_begin_arg < 0xffffffff /* 65536000000 */) {
+		} else {
 			base_clock = CLOCK_1_KHZ;
 			timer = cmd->scan_begin_arg / 1000000;
 		}
-- 
1.8.3.2

