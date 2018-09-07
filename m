From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Sep 2018 19:44:32 +0000
Subject: [bug report] net: dsa: b53: Make SRAB driver manage port interrupts
Message-Id: <20180907194432.3hhx2hya62z6rrrn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

This is a semi-automatic email about new static checker warnings.

The patch 16994374a6fc: "net: dsa: b53: Make SRAB driver manage port 
interrupts" from Sep 5, 2018, leads to the following Smatch complaint:

    drivers/net/dsa/b53/b53_srab.c:633 b53_srab_remove()
     warn: variable dereferenced before check 'dev' (see line 630)

drivers/net/dsa/b53/b53_srab.c
   629		struct b53_device *dev = platform_get_drvdata(pdev);
   630		struct b53_srab_priv *priv = dev->priv;
                                             ^^^^^^^^
We added a dereference.

   631	
   632		b53_srab_intr_set(priv, false);
   633		if (dev)
                    ^^^
The old code assumed "dev" could be NULL.

   634			b53_switch_remove(dev);
   635	

regards,
dan carpenter
