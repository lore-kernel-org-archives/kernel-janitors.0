From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Feb 2017 20:24:35 +0000
Subject: [RFC] mips: ath79: clock:- Unmap region obtained by of_iomap
Message-Id: <5fac1423-00e9-e5b2-161d-5ddc2f47bfc9@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: antonynpavlov@gmail.comantonynpavlov@gmail.com, albeu@free.fr, hackpascal@gmail.com, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-mips@linux-mips.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>

Hi,

I had a patch similar to:

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/arc=
h/mips/ath79/clock.c?id=B3d91db3f71d5f70ea60d900425a3f96aeb3d065

in my own tree.

However, mine was slightly different and was also freeing the memory=20
mapping in the normal case, when 'pll_base' seems to be no more useful.

Best regards,

CJ

=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index c1102cffe37d..b5d81acb2d7a 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -508,9 +508,11 @@ static void __init ath79_clocks_init_dt_ng(struct=20
device_node *np)
          ar9330_clk_init(ref_clk, pll_base);
      else {
          pr_err("%s: could not find any appropriate clk_init()\n", dnfn);
-        goto err_clk;
+        goto err_unmap;
      }

+    iounmap(pll_base);
+
      if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
          pr_err("%s: could not register clk provider\n", dnfn);
          goto err_clk;
@@ -518,6 +520,8 @@ static void __init ath79_clocks_init_dt_ng(struct=20
device_node *np)

      return;

+err_unmap:
+    iounmap(pll_base);
  err_clk:
      clk_put(ref_clk);


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
