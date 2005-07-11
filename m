From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Mon, 11 Jul 2005 05:00:15 +0000
Subject: [KJ] network drivers that still use cli()
Message-Id: <1121058015.3554.37.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12093756276055045=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: netdev@vger.kernel.org

--===============12093756276055045==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

the following list of files still use cli().  Are all of these still in
use?

The eventual goal is I'd like to remove the unused drivers and fix the
others.


drivers/net/wan/sdla_x25.c
drivers/net/cris/eth_v10.c
drivers/net/irda/ep7211_ir.c
drivers/net/fec.c
drivers/net/tulip/xircom_tulip_cb.c
drivers/net/hamradio/dmascc.c
drivers/net/oaknet.c
drivers/net/ni52.c



--===============12093756276055045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12093756276055045==--
