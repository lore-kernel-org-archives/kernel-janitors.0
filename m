From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Jul 2017 19:28:10 +0000
Subject: [PATCH] coccinelle: api: detect unnecessary le16_to_cpu
Message-Id: <1498937290-12285-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

As reported by Sebastian Reichel, i2c_smbus_read_word_data() returns native
endianness for little-endian bus (it basically has builtin
le16_to_cpu). Calling le16_to_cpu on the result breaks support on big
endian machines by converting it back.

This semantic patch give no reports on kernel code currently, but the
issue is somewhat obscure and has occurred in a sumitted patch, so it could
be good to have a check for it.

Suggested-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

The rule could easily be extended with more such functions.  Let me know if
anything else should be taken into account.

 scripts/coccinelle/api/smbus_word.cocci |   45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/scripts/coccinelle/api/smbus_word.cocci b/scripts/coccinelle/api/smbus_word.cocci
new file mode 100644
index 0000000..b167cf0
--- /dev/null
+++ b/scripts/coccinelle/api/smbus_word.cocci
@@ -0,0 +1,45 @@
+/// i2c_smbus_read_word_data() returns native endianness for little-endian
+/// bus (it basically has builtin le16_to_cpu). Calling le16_to_cpu on the
+/// result breaks support on big endian machines by converting it back.
+///
+// Confidence: Moderate
+// Copyright: (C) 2017 Julia Lawall, Inria. GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Options: --no-includes --include-headers
+// Keywords: i2c_smbus_read_word_data, le16_to_cpu
+
+virtual context
+virtual org
+virtual report
+
+// ----------------------------------------------------------------------------
+
+@r depends on context || org || report exists@
+expression e, x;
+position j0, j1;
+@@
+
+* x@j0 = i2c_smbus_read_word_data(...)
+... when != x = e
+* le16_to_cpu@j1(x)
+
+// ----------------------------------------------------------------------------
+
+@script:python r_org depends on org@
+j0 << r.j0;
+j1 << r.j1;
+@@
+
+msg = "le16_to_cpu not needed on i2c_smbus_read_word_data result."
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "")
+
+// ----------------------------------------------------------------------------
+
+@script:python r_report depends on report@
+j0 << r.j0;
+j1 << r.j1;
+@@
+
+msg = "le16_to_cpu not needed on i2c_smbus_read_word_data result around line %s." % (j1[0].line)
+coccilib.report.print_report(j0[0], msg)

