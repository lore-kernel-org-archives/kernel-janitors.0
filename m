From: jolsa@redhat.com
Date: Thu, 16 Jul 2009 19:44:28 +0000
Subject: [PATCH 3/3] tracing: removing .globl in the scripts/recordmcount.pl doc
Message-Id: <1247773468-11594-4-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1247773468-11594-1-git-send-email-jolsa@redhat.com>
In-Reply-To: <1247773468-11594-1-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@elte.hu, rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I was reading throught the recordmcount.pl starting comment,
and spot a tiny discrepancy.

The second example is about my_func not being global, but the example code
has the ".globl my_func" statement just moved. IMO it should be erased,
if not I'm curious what I'm missing.. :)

wbr,
jirka

Signed-off-by: Jiri Olsa <jolsa@redhat.com>

---
 scripts/recordmcount.pl |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 7109e2b..db4ebe1 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -57,7 +57,6 @@
 #        call mcount  (offset: 0x5)
 #        [...]
 #        ret
-#  .globl my_func
 #  other_func:
 #        [...]
 #        call mcount (offset: 0x1b)
-- 
1.6.2.5

