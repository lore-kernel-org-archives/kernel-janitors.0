From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 24 Jul 2010 16:07:01 +0000
Subject: check capabilities in open()
Message-Id: <20100724160701.GA4907@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I've found that some drivers check process capabilities via capable() in
open(), not in ioctl()/write()/etc.

I cannot find answer in POSIX, but IMO process expects that file
descriptors of priviledged user and file descriptors of the same
file/device are the same in priviledge aspect. Driver should deny/allow
open() and deny/allow ioctl() based on user priviledges. The path how
the process gained this fd doesn't matter.

So I think these 2 examples should be equal:

1) root process opened the file and then dropped its priviledges

2) nonroot process opened the file

Currently gained fds are different in priviledge aspect.


If you think these are bugs, I can move capable() checking down to
ioctl()/write()/read()/etc.



This is the full list of such drivers:

drivers/staging/comedi/comedi_fops.c
drivers/oprofile/event_buffer.c
drivers/s390/char/vmcp.c
drivers/s390/char/zcore.c
drivers/net/ppp_generic.c
drivers/scsi/3w-sas.c
drivers/scsi/pmcraid.c
drivers/scsi/megaraid.c
drivers/scsi/megaraid/megaraid_sas.c
drivers/scsi/megaraid/megaraid_mm.c
drivers/char/mem.c
drivers/char/tty_io.c
drivers/char/agp/frontend.c
drivers/char/apm-emulation.c


This is coccinelle script to find that:

@ r1 @
identifier fops;
identifier openx;
@@

struct file_operations fops = {
...
.open       = openx,
...
};


@@
identifier r1.openx;
@@

openx(...)
{
...
*capable(...)
...
}
