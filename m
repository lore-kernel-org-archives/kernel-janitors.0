From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Feb 2020 05:11:30 +0000
Subject: [bug report] node: Add memory-side caching attributes
Message-Id: <20200205051130.iiieepxhebjo76di@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Keith Busch,

The patch acc02a109b04: "node: Add memory-side caching attributes"
from Mar 11, 2019, leads to the following static checker warning:

	drivers/base/node.c:279 node_init_cache_dev()
	error: kfree after device_register(): 'dev'

drivers/base/node.c
   257  static void node_init_cache_dev(struct node *node)
   258  {
   259          struct device *dev;
   260  
   261          dev = kzalloc(sizeof(*dev), GFP_KERNEL);
   262          if (!dev)
   263                  return;
   264  
   265          dev->parent = &node->dev;
   266          dev->release = node_cache_release;
   267          if (dev_set_name(dev, "memory_side_cache"))
   268                  goto free_dev;
   269  
   270          if (device_register(dev))
   271                  goto free_name;
   272  
   273          pm_runtime_no_callbacks(dev);
   274          node->cache_dev = dev;
   275          return;
   276  free_name:
   277          kfree_const(dev->kobj.name);
   278  free_dev:
   279          kfree(dev);
                ^^^^^^^^^^
Genereally we can't call kfree() after calling device_register().

   280  }

regards,
dan carpenter
