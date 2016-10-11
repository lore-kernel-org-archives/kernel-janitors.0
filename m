From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2016 07:17:37 +0000
Subject: re: driver core: add test of driver remove calls during probe
Message-Id: <20161011071737.GA6433@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rob Herring,

This is a semi-automatic email about new static checker warnings.

The patch bea5b158ff0d: "driver core: add test of driver remove calls 
during probe" from Aug 11, 2016, leads to the following Smatch 
complaint:

drivers/base/dd.c:386 really_probe()
	 warn: variable dereferenced before check 'dev->bus' (see line 373)

drivers/base/dd.c
   372	
   373		if (dev->bus->probe) {
                    ^^^^^^^^^^^^^^^
Old code just dereferenced ->bus without checking.

   374			ret = dev->bus->probe(dev);
   375			if (ret)
   376				goto probe_failed;
   377		} else if (drv->probe) {
   378			ret = drv->probe(dev);
   379			if (ret)
   380				goto probe_failed;
   381		}
   382	
   383		if (test_remove) {
   384			test_remove = false;
   385	
   386			if (dev->bus && dev->bus->remove)
                            ^^^^^^^^
So this test can probably be removed.

   387				dev->bus->remove(dev);
   388			else if (drv->remove)

regards,
dan carpenter
