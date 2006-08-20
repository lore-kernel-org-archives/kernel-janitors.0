From: "Johann Uhrmann" <johann.uhrmann@gmail.com>
Date: Sun, 20 Aug 2006 10:02:22 +0000
Subject: [KJ] Unused OSS drivers?
Message-Id: <3ae4f6940608200302x369beaadi1135e6afe0c92b6a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

in the kernel 2.6.18-rc4 (from git) I found two unchecked calls to
request_region
and tried to write a patch for it.
However, I could not manage to compile those drivers - they seem to be missing
in menuconfig.

Which settings are necessary to compile the following files:
sound/oss/msnd_*.c
sound/oss/gus_wave.c

If there is really no way to compile those drivers, I guess they
should be completely removed from the kernel source.

Kind regards,

Johann Uhrmann
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
