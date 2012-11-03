From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:21 +0000
Subject: [PATCH 0/16] use WARN
Message-Id: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches use WARN, which combines printk and WARN_ON(1), or WARN_ONCE,
which combines printk and WARN_ON_ONCE(1).  This does not appear to affect
the behavior, but makes the code a little more concise.

The semantic patch that makes this transformation is as follows
(http://coccinelle.lip6.fr/).  In particular, it only transforms the case
where the WARN_ON or WARN_ON_ONCE is preceded by a single printk.

// <smpl>
@bad1@
position p;
@@

printk(...);
printk@p(...);
WARN_ON(1);

@ok1@
expression list es;
position p != bad1.p;
@@

-printk@p(
+WARN(1,
  es);
-WARN_ON(1);

@@
expression list ok1.es;
@@

if (...)
- {
  WARN(1,es);
- }

@bad2@
position p;
@@

printk(...);
printk@p(...);
WARN_ON_ONCE(1);

@ok2@
expression list es;
position p != bad2.p;
@@

-printk@p(
+WARN_ONCE(1,
  es);
-WARN_ON_ONCE(1);

@@
expression list ok2.es;
@@

if (...)
- {
  WARN_ONCE(1,es);
- }
// </smpl>

