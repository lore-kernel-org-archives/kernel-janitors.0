From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:09:23 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/3] video/radeon_base: replace
Message-Id: <20040927230923.GT1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40089322394248783=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916231114.GE1777@us.ibm.com>
In-Reply-To: <20040916231114.GE1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============40089322394248783==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msecs_to_jiffies() instead of the custom MS_TO_HZ().

--- 2.6.9-rc2-vanilla/drivers/video/aty/radeon_base.c	2004-09-13 17:15:37.000000000 -0700
+++ 2.6.9-rc2/drivers/video/aty/radeon_base.c	2004-09-14 14:13:47.000000000 -0700
@@ -1286,7 +1286,7 @@ static void radeon_write_mode (struct ra
 					OUTREG(LVDS_GEN_CNTL, mode->lvds_gen_cntl | LVDS_BLON);
 				rinfo->pending_lvds_gen_cntl = mode->lvds_gen_cntl;
 				mod_timer(&rinfo->lvds_timer,
-					  jiffies + MS_TO_HZ(rinfo->panel_info.pwr_delay));
+					  jiffies + msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 			}
 		}
 	}

--===============40089322394248783==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40089322394248783==--
