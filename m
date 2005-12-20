From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 13:16:53 +0000
Subject: [KJ] [Patch 3/5] Cleanup MIN/MAX Macro usage in eicon/io.c
Message-Id: <1135084614.24065.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62604833379277447=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62604833379277447==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

This patch changes eicon/di.c from MIN/MAX usage
to min/max.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/isdn/hardware/eicon/io.c.orig	2005-12-20 09:57:20.000000000 +0100
+++ linux-2.6.15-rc6/drivers/isdn/hardware/eicon/io.c	2005-12-20 09:57:26.000000000 +0100
@@ -262,7 +262,7 @@ void request(PISDN_ADAPTER IoAdapter, EN
     case IDI_SYNC_REQ_XDI_GET_CAPI_PARAMS: {
        diva_xdi_get_capi_parameters_t prms, *pI = &syncReq->xdi_capi_prms.info;
        memset (&prms, 0x00, sizeof(prms));
-       prms.structure_length = MIN(sizeof(prms), pI->structure_length);
+       prms.structure_length = min(sizeof(prms), pI->structure_length);
        memset (pI, 0x00, pI->structure_length);
        prms.flag_dynamic_l1_down    = (IoAdapter->capi_cfg.cfg_1 & \
          DIVA_XDI_CAPI_CFG_1_DYNAMIC_L1_ON) ? 1 : 0;



--===============62604833379277447==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62604833379277447==--
