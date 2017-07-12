From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 12 Jul 2017 20:45:26 +0000
Subject: Re: [bug report] dax: refactor dax-fs into a generic provider of 'struct dax_device' instances
Message-Id: <CAPcyv4jxfGPCq3fbM2qU2XRLWrfQHLv=jwWdxudzgOR3SUHH8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711074910.r3xthhzzki4hr7tc@mwanda>
In-Reply-To: <20170711074910.r3xthhzzki4hr7tc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2017 at 12:49 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> Hello Dan Williams,
>
> The patch 7b6be8444e0f: "dax: refactor dax-fs into a generic provider
> of 'struct dax_device' instances" from Apr 11, 2017, leads to the
> following static checker warning:
>
>         drivers/dax/device.c:643 devm_create_dev_dax()
>         warn: passing zero to 'ERR_PTR'

Yes, there's a couple things to clean up here:

>
> drivers/dax/device.c
>    561  struct dev_dax *devm_create_dev_dax(struct dax_region *dax_region,
>    562                  struct resource *res, int count)
>    563  {
>    564          struct device *parent = dax_region->dev;
>    565          struct dax_device *dax_dev;
>    566          struct dev_dax *dev_dax;
>    567          struct inode *inode;
>    568          struct device *dev;
>    569          struct cdev *cdev;
>    570          int rc = 0, i;
>                     ^^^^^^
> This makes me think it's deliberate.

I think it would be fine to make this default to -ENOMEM.

>
>    571
>    572          dev_dax = kzalloc(sizeof(*dev_dax) + sizeof(*res) * count, GFP_KERNEL);
>    573          if (!dev_dax)
>    574                  return ERR_PTR(-ENOMEM);
>    575
>    576          for (i = 0; i < count; i++) {
>    577                  if (!IS_ALIGNED(res[i].start, dax_region->align)
>    578                                  || !IS_ALIGNED(resource_size(&res[i]),
>    579                                          dax_region->align)) {
>    580                          rc = -EINVAL;
>    581                          break;
>    582                  }
>    583                  dev_dax->res[i].start = res[i].start;
>    584                  dev_dax->res[i].end = res[i].end;
>    585          }
>    586
>    587          if (i < count)
>    588                  goto err_id;
>
> We return NULL here.  Probably that's intended?

No, I would expect if 'i' is less than count rc is -EINVAL. Hmm,
unless count is 0 which it can't be, but the static analyzer would
need to audit all callers to find that out.

>
>    589
>    590          dev_dax->id = ida_simple_get(&dax_region->ida, 0, 0, GFP_KERNEL);
>    591          if (dev_dax->id < 0) {
>    592                  rc = dev_dax->id;
>    593                  goto err_id;
>    594          }
>    595
>    596          /*
>    597           * No 'host' or dax_operations since there is no access to this
>    598           * device outside of mmap of the resulting character device.
>    599           */
>    600          dax_dev = alloc_dax(dev_dax, NULL, NULL);
>    601          if (!dax_dev)
>    602                  goto err_dax;
>
> There is a comment in front of this allocation, but allocation failures
> almost always mean we return an error...  I'm not sure.  The caller
> treats this path as success.  I don't see an immediate problem with
> that.

This should be a -ENOMEM failure.

>
>    603
>    604          /* from here on we're committed to teardown via dax_dev_release() */
>    605          dev = &dev_dax->dev;
>    606          device_initialize(dev);
>    607
>    608          inode = dax_inode(dax_dev);
>    609          cdev = inode->i_cdev;
>    610          cdev_init(cdev, &dax_fops);
>    611          cdev->owner = parent->driver->owner;
>    612
>    613          dev_dax->num_resources = count;
>    614          dev_dax->dax_dev = dax_dev;
>    615          dev_dax->region = dax_region;
>    616          kref_get(&dax_region->kref);
>    617
>    618          dev->devt = inode->i_rdev;
>    619          dev->class = dax_class;
>    620          dev->parent = parent;
>    621          dev->groups = dax_attribute_groups;
>    622          dev->release = dev_dax_release;
>    623          dev_set_name(dev, "dax%d.%d", dax_region->id, dev_dax->id);
>    624
>    625          rc = cdev_device_add(cdev, dev);
>    626          if (rc) {
>    627                  kill_dev_dax(dev_dax);
>    628                  put_device(dev);
>    629                  return ERR_PTR(rc);
>    630          }
>    631
>    632          rc = devm_add_action_or_reset(dax_region->dev, unregister_dev_dax, dev);
>    633          if (rc)
>    634                  return ERR_PTR(rc);
>
> It really feels like there should be more error handling here...

unregister_dev_dax() is called if devm_add_action_or_reset() fails,
does that satisfy your concern?

>
>    635
>    636          return dev_dax;
>    637
>    638   err_dax:
>    639          ida_simple_remove(&dax_region->ida, dev_dax->id);
>    640   err_id:
>    641          kfree(dev_dax);
>    642
>    643          return ERR_PTR(rc);
>    644  }
>
> regards,
> dan carpenter

Thanks for the report!
