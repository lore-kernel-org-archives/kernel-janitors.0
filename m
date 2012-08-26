From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 16:00:52 +0000
Subject: [PATCH 0/13] use clk_prepare_enable and clk_disable_unprepare
Message-Id: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
clk_enable, and clk_disable and clk_unprepare.  They make the code more
concise, and ensure that clk_unprepare is called when clk_enable fails.

The transformation is made using the following semantic patch
(http://coccinelle.lip6.fr/).  This semantic patch is not really safe, in
that it doesn't check for clk_disable's that are relying on the removed
clk_unprepare's.  These cases have been adjusted by hand.

// <smpl>
@@
expression e;
@@

- clk_prepare(e);
- clk_enable(e);
+ clk_prepare_enable(e);

@@
expression e;
identifier r;
statement S;
@@

- r = clk_prepare(e); if (r) S
- clk_enable(e);
+ r = clk_prepare_enable(e); if (r) S

@@
expression e;
expression r;
@@

- clk_prepare(e);
  r - clk_enable
+ clk_prepare_enable
  (e);
  if (r) { ...
- clk_unprepare(e); // unsafe!
  ...
  return ...;
  }

@@
expression e;
expression r;
@@

- clk_prepare(e);
  r - clk_enable
+ clk_prepare_enable
  (e);

@@
expression e;
statement S;
@@

- if (clk_prepare(e)) S
- clk_enable(e);
+ if (clk_prepare_enable(e)) S

@@
expression e;
@@

- clk_prepare(e);
  if (
- clk_enable(e)
+ clk_prepare_enable(e)
  ) { ...
- clk_unprepare(e); // unsafe!
  ...
  return ...;
  }

@@
expression e;
statement S;
@@

- clk_prepare(e);
  if (
- clk_enable(e)
+ clk_prepare_enable(e)
  ) S

@@
expression e,r2;
identifier r1;
statement S;
@@

- r1 = clk_prepare(e); if (r1) S
  r2 -  clk_enable
+  clk_prepare_enable
   (e);
  if (r2) { ...
- clk_unprepare(e); // unsafe!
  ...
  return ...;
  }

@@
expression e,r2;
identifier r1;
statement S;
@@

- r1 = clk_prepare(e); if (r1) S
  r2 -  clk_enable
+  clk_prepare_enable
   (e);

@@
expression e;
statement S1;
@@

- if (clk_prepare(e)) S1
  if (
-  clk_enable
+  clk_prepare_enable
     (e)) { ...
- clk_unprepare(e); // unsafe!
  ...
  return ...;
  }

@@
expression e;
statement S1,S2;
@@

- if (clk_prepare(e)) S1
  if (
-  clk_enable
+  clk_prepare_enable
     (e)) S2

@@
expression e;
@@

- clk_disable(e);
- clk_unprepare(e);
+ clk_disable_unprepare(e);
// </smpl>

