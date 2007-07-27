From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:44:13 +0000
Subject: [PATCH 03/68] 0 -> NULL, for arch/arm26
Message-Id: <200707270944.LAA17103@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: spyro@f2s.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: spyro@f2s.com
Cc: akpm@linux-foundation.org
---

 udivdi3.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm26/lib/udivdi3.c b/arch/arm26/lib/udivdi3.c
index d25195f..0f8e702 100644
--- a/arch/arm26/lib/udivdi3.c
+++ b/arch/arm26/lib/udivdi3.c
@@ -127,7 +127,7 @@ __udivmoddi4 (UDItype n, UDItype d, UDIt
           /* Remainder in n0 >> bm.  */
         }
 
-      if (rp != 0)
+      if (rp != NULL)
         {
           rr.s.low = n0 >> bm;
           rr.s.high = 0;
@@ -144,7 +144,7 @@ __udivmoddi4 (UDItype n, UDItype d, UDIt
           q1 = 0;
 
           /* Remainder in n1n0.  */
-          if (rp != 0)
+          if (rp != NULL)
             {
               rr.s.low = n0;
               rr.s.high = n1;
@@ -176,7 +176,7 @@ __udivmoddi4 (UDItype n, UDItype d, UDIt
 
               q1 = 0;
 
-              if (rp != 0)
+              if (rp != NULL)
                 {
                   rr.s.low = n0;
                   rr.s.high = n1;
@@ -208,7 +208,7 @@ __udivmoddi4 (UDItype n, UDItype d, UDIt
               q1 = 0;
 
               /* Remainder in (n1n0 - m1m0) >> bm.  */
-              if (rp != 0)
+              if (rp != NULL)
                 {
                   sub_ddmmss (n1, n0, n1, n0, m1, m0);
                   rr.s.low = (n1 << b) | (n0 >> bm);

