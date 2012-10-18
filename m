From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 02:38:55 +0000
Subject: [usb:usb-linus 22/26] drivers/usb/serial/iuu_phoenix.c:1191:43-44: port_probe: first occurrence line
Message-Id: <20121018023855.GE21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Johan,

FYI, there are coccinelle warnings in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   bf90ff5f3b8f67e5b42df4ea4fd543f8010a2676
commit: 53636555b9190f88320d9d46cf142f8797895456 [22/26] USB: iuu_phoenix: fix port-data memory leak

+ drivers/usb/serial/iuu_phoenix.c:1191:43-44: port_probe: first occurrence line 1200, second occurrence line 1210
+ drivers/usb/serial/iuu_phoenix.c:1191:43-44: port_remove: first occurrence line 1201, second occurrence line 1211

60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1191) static struct usb_serial_driver iuu_device = {
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1192)         .driver = {
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1193)                    .owner = THIS_MODULE,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1194)                    .name = "iuu_phoenix",
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1195)                    },
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1196)         .id_table = id_table,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1197)         .num_ports = 1,
bbcb2b90 (Johan Hovold          2010-03-17 23:00:37 +0100  1198)         .bulk_in_size = 512,
bbcb2b90 (Johan Hovold          2010-03-17 23:00:37 +0100  1199)         .bulk_out_size = 512,
20eda943 (Olivier Bornet        2009-08-18 21:05:55 +0200 @1200)         .port_probe = iuu_create_sysfs_attrs,
20eda943 (Olivier Bornet        2009-08-18 21:05:55 +0200 @1201)         .port_remove = iuu_remove_sysfs_attrs,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1202)         .open = iuu_open,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1203)         .close = iuu_close,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1204)         .write = iuu_uart_write,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1205)         .read_bulk_callback = iuu_uart_read_callback,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1206)         .tiocmget = iuu_tiocmget,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1207)         .tiocmset = iuu_tiocmset,
96dab77e (Olivier Bornet        2009-06-11 12:54:20 +0100  1208)         .set_termios = iuu_set_termios,
fe1ae7fd (Alan Cox              2009-09-19 13:13:33 -0700  1209)         .init_termios = iuu_init_termios,
53636555 (Johan Hovold          2012-10-17 13:34:59 +0200 @1210)         .port_probe = iuu_port_probe,
53636555 (Johan Hovold          2012-10-17 13:34:59 +0200 @1211)         .port_remove = iuu_port_remove,
60a8fc01 (Alain Degreffe        2007-10-26 13:51:49 +0200  1212) };

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
