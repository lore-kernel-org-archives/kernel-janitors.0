From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 08 Sep 2007 12:08:06 +0000
Subject: perhaps init/ should update the reference to "change floppy"
Message-Id: <Pine.LNX.4.64.0709080802430.8930@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from init/do_mounts_rd.c:

...
static int __init prompt_ramdisk(char *str)
{
        rd_prompt = simple_strtol(str,NULL,0) & 1;
        return 1;
}
__setup("prompt_ramdisk=", prompt_ramdisk);
...
int __init rd_load_disk(int n)
{
        if (rd_prompt)
                change_floppy("root floppy disk to be loaded into RAM disk");
        create_dev("/dev/root", ROOT_DEV);
        create_dev("/dev/ram", MKDEV(RAMDISK_MAJOR, n));
        return rd_load_image("/dev/root");
}
...

  but isn't it a bit archaic to suggest that an explicit ramdisk will
be found only on a floppy?  can't one be provided on a CD or DVD?
just suggesting that the terminology could probably be updated.

rday

p.s.  the "prompt_ramdisk" boot-time param is not documented in
Doc/kernel-parameters.txt.  i'm assuming that's just an oversight
since that option still looks active.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
