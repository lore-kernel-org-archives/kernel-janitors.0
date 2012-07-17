From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jul 2012 09:42:39 +0000
Subject: re: [SCSI] async: introduce 'async_domain' type
Message-Id: <20120717094239.GA22237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

The patch 7d714a725c9f: "[SCSI] async: introduce 'async_domain' type"
from Jun 21, 2012, leads to the following warnings:

sound/soc/soc-dapm.c:1646:42: warning: incorrect type in argument 3 (different base types)
sound/soc/soc-dapm.c:1646:42:    expected struct async_domain *domain
sound/soc/soc-dapm.c:1646:42:    got struct list_head *<noident>
sound/soc/soc-dapm.c:1647:40: warning: incorrect type in argument 1 (different base types)
sound/soc/soc-dapm.c:1647:40:    expected struct async_domain *domain
sound/soc/soc-dapm.c:1647:40:    got struct list_head *<noident>
sound/soc/soc-dapm.c:1660:42: warning: incorrect type in argument 3 (different base types)
sound/soc/soc-dapm.c:1660:42:    expected struct async_domain *domain
sound/soc/soc-dapm.c:1660:42:    got struct list_head *<noident>
sound/soc/soc-dapm.c:1661:40: warning: incorrect type in argument 1 (different base types)
sound/soc/soc-dapm.c:1661:40:    expected struct async_domain *domain
sound/soc/soc-dapm.c:1661:40:    got struct list_head *<noident>
sound/soc/soc-dapm.c: In function ‘dapm_power_widgets’:
sound/soc/soc-dapm.c:1646:6: warning: passing argument 3 of ‘async_schedule_domain’ from incompatible pointer type [enabled by default]
In file included from sound/soc/soc-dapm.c:29:0:
sound/soc/soc-dapm.c:1647:2: warning: passing argument 1 of ‘async_synchronize_full_domain’ from incompatible pointer type [enabled by default]
In file included from sound/soc/soc-dapm.c:29:0:
sound/soc/soc-dapm.c:1660:6: warning: passing argument 3 of ‘async_schedule_domain’ from incompatible pointer type [enabled by default]
In file included from sound/soc/soc-dapm.c:29:0:
sound/soc/soc-dapm.c:1661:2: warning: passing argument 1 of ‘async_synchronize_full_domain’ from incompatible pointer type [enabled by default]
In file included from sound/soc/soc-dapm.c:29:0:

It looks like that file needs updating still.

regards,
dan carpenter

