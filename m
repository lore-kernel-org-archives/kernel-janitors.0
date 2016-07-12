From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jul 2016 22:26:44 +0000
Subject: [bug report] cdrom: Add support for Sega Dreamcast GD-ROM.
Message-Id: <20160712222643.GA16176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Adrian McMenamin,

The patch 74ee1a7590b7: "cdrom: Add support for Sega Dreamcast
GD-ROM." from Jan 21, 2008, leads to the following static checker
warning:

	drivers/cdrom/gdrom.c:457 gdrom_getsense()
	warn: was hexadecimal intended '40'

drivers/cdrom/gdrom.c
   456          insw(GDROM_DATA_REG, &sense, sense_command->buflen/2);
   457          if (sense[1] & 40) {

Yeah.  It looks like 0x40 was actually intended.

   458                  pr_info("Drive not ready - command aborted\n");
   459                  goto cleanup_sense;
   460          }
   461          sense_key = sense[1] & 0x0F;
   462          if (sense_key < ARRAY_SIZE(sense_texts))
   463                  pr_info("%s\n", sense_texts[sense_key].text);
   464          else
   465                  pr_err("Unknown sense key: %d\n", sense_key);
   466          if (bufstring) /* return addional sense data */
   467                  memcpy(bufstring, &sense[4], 2);
   468          if (sense_key < 2)
   469                  err = 0;

regards,
dan carpenter
