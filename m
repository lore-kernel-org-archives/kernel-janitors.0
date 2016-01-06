From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 10:58:01 +0000
Subject: re: mfd: PCF50633 core driver
Message-Id: <20160106105801.GA1666@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Balaji Rao,

The patch f52046b14b1e: "mfd: PCF50633 core driver" from Jan 9, 2009,
leads to the following static checker warning:

	drivers/mfd/pcf50633-core.c:224 pcf50633_probe()
	warn: 'pcf50633_reg_read(pcf, 0)()' returns unsigned values

drivers/mfd/pcf50633-core.c
   221  
   222          version = pcf50633_reg_read(pcf, 0);
                          ^^^^^^^^^^^^^^^^^^^^^^^^^
These return 0xFF on error, they don't return negative values.

   223          variant = pcf50633_reg_read(pcf, 1);
   224          if (version < 0 || variant < 0) {
   225                  dev_err(pcf->dev, "Unable to probe pcf50633\n");
   226                  ret = -ENODEV;
   227                  return ret;
   228          }
   229  

regards,
dan carpenter
