From: Amit Gud <gud@eth.net>
Date: Fri, 11 Mar 2005 14:30:50 +0000
Subject: [KJ] [PATCH] 2/3 unified spinlock initialization
Message-Id: <4231A8CA.7020504@eth.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050311142920.GB3028@neon>
In-Reply-To: <20050311142920.GB3028@neon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

   Unify the spinlock initialization as far as possible.

   Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- ../kernels/linux-2.6.11/drivers/media/dvb/b2c2/skystar2.c   
2005-03-10 12:03:49.000000000 +0530
+++ kj-2.6.11/drivers/media/dvb/b2c2/skystar2.c 2005-03-11 
19:23:22.773932112 +0530
@@ -1968,7 +1968,7 @@ static int driver_initialize(struct pci_
                ctrl_enable_mac(adapter, 1);
        }

-       adapter->lock = SPIN_LOCK_UNLOCKED;
+       spin_lock_init(&adapter->lock);

 out:
        return ret;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
