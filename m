From: Amit Gud <gud@eth.net>
Date: Fri, 11 Mar 2005 14:34:54 +0000
Subject: [KJ] [PATCH 3/3] unified spinlock initialization
Message-Id: <4231A9BE.1040008@eth.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050311143030.GC3028@neon>
In-Reply-To: <20050311143030.GC3028@neon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

   Unify the spinlock initialization as far as possible.

   Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- ../kernels/linux-2.6.11/drivers/media/dvb/dibusb/dvb-dibusb-pid.c   
2005-03-10 12:03:49.000000000 +0530
+++ kj-2.6.11/drivers/media/dvb/dibusb/dvb-dibusb-pid.c 2005-03-11 
19:25:41.942775232 +0530
@@ -21,7 +21,7 @@ int dibusb_pid_list_init(struct usb_dibu

        deb_xfer("initializing %d pids for the 
pid_list.\n",dib->dibdev->dev_cl->demod->pid_filter_count);

-       dib->pid_list_lock = SPIN_LOCK_UNLOCKED;
+       spin_lock_init(&dib->pid_list_lock);
        
memset(dib->pid_list,0,dib->dibdev->dev_cl->demod->pid_filter_count*(sizeof(struct 
dibusb_pid)));
        for (i=0; i < dib->dibdev->dev_cl->demod->pid_filter_count; i++) {
                dib->pid_list[i].index = i;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
