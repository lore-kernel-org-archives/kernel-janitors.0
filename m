From: madhusudhan seshadri <madhusudhan1508@yahoo.co.in>
Date: Sat, 12 Mar 2005 09:45:17 +0000
Subject: [KJ] How To invoke atmdev_ops function in MPC8260 SAR driver
Message-Id: <20050312094517.79735.qmail@web8401.mail.in.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I 'm trying to invoke ATM device operations functions
to  test MPC8260 SAR driver.
The board doesn't consist of Pyhsical layer regarding
hardware(like IDT77106) or software(driver).
Loopback is done on UTOPIA interface.UTOPIA signals
are connected PCI bus.Can anyone please help me
out,HOW TO use the following finctions
in aplication 

const struct atmdev_ops mpc8260sar_ops = {
    open:mpc8260sar_open,
    close:mpc8260sar_close,
    ioctl:mpc8260sar_ioctl,
    getsockopt:mpc8260sar_getsockopt,
    setsockopt:mpc8260sar_setsockopt,
    send:mpc8260sar_send,
    sg_send:mpc8260sar_sg_send,
    phy_put:mpc8260sar_phy_put,
    phy_get:mpc8260sar_phy_get,
    change_qos:mpc8260sar_change_qos,
    proc_read:mpc8260sar_proc_read,
    owner:THIS_MODULE,
};

I'm new to LINUX ENVIORNMENT 

with regargs
MADHU

________________________________________________________________________
Yahoo! India Matrimony: Find your life partner online
Go to: http://yahoo.shaadi.com/india-matrimony
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
