From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2020 14:06:06 +0000
Subject: [bug report] driver core: platform: Add devm_platform_get_irqs_affinity()
Message-Id: <X9jCzrzqfyEHIi26@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello John Garry,

The patch e15f2fa959f2: "driver core: platform: Add
devm_platform_get_irqs_affinity()" from Dec 2, 2020, leads to the
following static checker warning:

	drivers/base/platform.c:370 devm_platform_get_irqs_affinity()
	warn: 'nvec' possible negative type promoted to high

drivers/base/platform.c
   351  int devm_platform_get_irqs_affinity(struct platform_device *dev,
   352                                      struct irq_affinity *affd,
   353                                      unsigned int minvec,
   354                                      unsigned int maxvec,
   355                                      int **irqs)
   356  {
   357          struct irq_affinity_devres *ptr;
   358          struct irq_affinity_desc *desc;
   359          size_t size;
   360          int i, ret, nvec;
   361  
   362          if (!affd)
   363                  return -EPERM;
   364  
   365          if (maxvec < minvec)
   366                  return -ERANGE;
   367  
   368          nvec = platform_irq_count(dev);
   369  
   370          if (nvec < minvec)
                    ^^^^
If "nvec" is -EPROBE_DEFER then "minvec" is an unsigned int so it gets
type promoted to a very high positive so it's > minvec.

   371                  return -ENOSPC;
   372  
   373          nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
   374          if (nvec < minvec)
   375                  return -ENOSPC;
   376  
   377          if (nvec > maxvec)
   378                  nvec = maxvec;
   379  
   380          size = sizeof(*ptr) + sizeof(unsigned int) * nvec;

regards,
dan carpenter
