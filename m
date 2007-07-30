From: <postfail@hushmail.com>
Date: Mon, 30 Jul 2007 05:39:07 +0000
Subject: [PATCH]:  ioremap function balancing in init/cleanup sound/oss/dmasound/dmacound_awacs.c
Message-Id: <20070730053908.62A05DA82E@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Two cases where ioremap can be called in init function but will
never be cleaned up. patch is against 2.6.23-rc1.

Signed-off-by: Post Fail <postfail <at> hushmail.com>
- ---

- --- ./linux-2.6.22.clean/sound/oss/dmasound/dmasound_awacs.c	2007-
07-08 19:32:17.000000000 -0400
+++ ./linux-2.6.22/sound/oss/dmasound/dmasound_awacs.c	2007-07-29
23:05:30.000000000 -0400
@@ -3204,6 +3204,12 @@ static void __exit dmasound_awacs_cleanu
 	}
 	dmasound_deinit();

+        if (latch_base)
+                iounmap(latch_base);
+
+        if (macio_base)
+                iounmap(macio_base);
+
 	of_node_put(awacs_node);
 	of_node_put(i2s_node);
 }

-----BEGIN PGP SIGNATURE-----
Note: This signature can be verified at https://www.hushtools.com/verify
Version: Hush 2.5

wpwEAQECAAYFAkateM4ACgkQ5iui/yAtoVllnAP/b/B6G+rmMgu0DXi6UOmpkPhw2aWZ
o8E7PiKXmqIjuxVcGERch+dQ5Fv2HytDWE0Wx7/T2P/4Q8rIbPLSemgIQmk0ZHUfPydG
mQ+kKMmtFI5MwJ63QeHwuz4O+E+3CzIS3j+ZDb+nYrOXOZexWHMWRSm8zG+3WjBj8wCH
G1z+Wvg=WXVV
-----END PGP SIGNATURE-----

--
Click here to find the right stock, bonds, and mutual funds.
http://tagline.hushmail.com/fc/Ioyw6h4dPQsHr6xVpkqxUgvUaGRi6snSI678yoStNKkIF2yytWsRWG/


