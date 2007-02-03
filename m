From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 03 Feb 2007 01:23:14 +0000
Subject: [KJ] [RFC] Regarding min/max
Message-Id: <45C3E402.3000307@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

Regarding converting:

	a = x < y ? x : y;

with
	a = min(x, y);
and etc.

What about variables in structs? It seem to not like the multiple lines in min()/max(),
so why not introduce something like:
#define __min(x,y)	((x) < (y) ? (x) : (y))
(and use __min() in min() also)? Then there would be no problem to clean up in the structs
+ the underscores should make people aware it does not type-check.

Just a thought
/Richard Knutsson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
