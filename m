From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Wed, 05 Nov 2014 08:15:08 +0000
Subject: How to access Linux Kernel environment Variables ?
Message-Id: <CAOD=uF4L+jvR=ckMdo3o4wdSsRcGynQnv_KOpDeyJst74YOxuA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi all,

Is there any system call in Linux which serve the purpose of  "kenv()"
of FreeBSD ?


In FreeBSD:
-----------------
Kernel environment variables are saved at "/boot/loader.conf"  and
those variables can be accessed using "kenv()"  system call in C
program.
----------------


Is there any similar functionality available in Linux kernel ?


Thanks
Santosh
