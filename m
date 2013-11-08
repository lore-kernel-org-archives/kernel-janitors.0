From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 10:05:21 +0000
Subject: re: gma500: initial medfield merge
Message-Id: <20131108100521.GU27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Kirill A. Shutemov,

This is a semi-automatic email about new static checker warnings.

The patch 026abc333205: "gma500: initial medfield merge" from Mar 8, 
2012, leads to the following Smatch complaint:

drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c:541 __read_panel_data()
	 warn: variable dereferenced before check 'sender' (see line 536)

drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
   535		unsigned long flags;
   536		struct drm_device *dev = sender->dev;
                                         ^^^^^^^^^^^
Dereference.

   537		int i;
   538		u32 gen_data_reg;
   539		int retry = MDFLD_DSI_READ_MAX_COUNT;
   540	
   541		if (!sender || !data_out || !len_out) {
                    ^^^^^^^
Check.

   542			DRM_ERROR("Invalid parameters\n");
   543			return -EINVAL;

regards,
dan carpenter
