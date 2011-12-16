From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 12:48:33 +0000
Subject: re: driver-core: implement 'sysdev' functionality for regular
Message-Id: <20111216124833.GA9100@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hello Kay Sievers,

This is a semi-automatic email about new static checker warnings.

The patch ca22e56debc5: "driver-core: implement 'sysdev' 
functionality for regular devices and buses" from Dec 14, 2011, leads 
to the following Smatch complaint:

drivers/base/bus.c +1200 subsys_interface_unregister()
	 warn: variable dereferenced before check 'sif' (see line 1196)

drivers/base/bus.c
  1195	{
  1196		struct bus_type *subsys = sif->subsys;
                                          ^^^^^^^^^^^
New dereference.

  1197		struct subsys_dev_iter iter;
  1198		struct device *dev;
  1199	
  1200		if (!sif)
                    ^^^^
New check.

  1201			return;
  1202	

regards,
dan carpenter

