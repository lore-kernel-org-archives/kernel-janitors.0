From: Dan Carpenter <error27@gmail.com>
Date: Sat, 05 Jun 2010 13:16:37 +0000
Subject: bug report: xgifb: buffer overflow issues
Message-Id: <20100605131637.GL5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnaud,

Smatch reported a couple of array overflows in the new xgifb driver
which was added to staging.

drivers/staging/xgifb/XGI_main_26.c +3080 xgifb_probe(125)
	error: strcpy() "0.84" too large for XGIhw_ext.szVBIOSVer (5 vs 4)
  3076            XGIhw_ext.pjCustomizedROMImage = NULL;
  3077            XGIhw_ext.bSkipDramSizing = 0;
  3078            XGIhw_ext.pQueryVGAConfigSpace = &XGIfb_query_VGA_config_space;
  3079  //      XGIhw_ext.pQueryNorthBridgeSpace = &XGIfb_query_north_bridge_space;
  3080            strcpy(XGIhw_ext.szVBIOSVer, "0.84");
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

XGIhw_ext.szVBIOSVer is an array of 4 characters but "0.84" is 5
characters long counting the NULL terminator.

vers/staging/xgifb/XGI_main_26.c +1733 XGIfb_get_fix(6)
	error: strcpy() myid too large for fix->id (20 vs 16)
  1730          DEBUGPRN("inside get_fix");
  1731          memset(fix, 0, sizeof(struct fb_fix_screeninfo));
  1732  
  1733          strcpy(fix->id, myid);
                ^^^^^^^^^^^^^^^^^^^^^

myid is 20 characters long and fix->id is 16 characters long.  I suggest
maybe change the myid to 16 characters and also use:
 
	strlcpy(fix->id, myid, sizeof(fix->id));

I would have sent a patch to do this, but I don't think myid is actually
initialized anywhere.  What should the myid string to say?

regards,
dan carpenter
