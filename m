From: Daniele Pizzoni <auouo@tin.it>
Date: Sun, 17 Oct 2004 16:13:58 +0000
Subject: [KJ] [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info in
Message-Id: <1098031764.3023.45.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54989549539190286=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

--===============54989549539190286==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello, I'm going to post a series of small janitorial patches focused on
1) replacing DPRINTK-style macros with pr_debug from kernel.h
2) replacing printk(KERN_INFO ...) with pr_info(...)
3) fixing _obvious_ inconsistencies of printk levels as:

printk(KERN_INFO "Start... ");
...
printk("Ok!\n");

The patches fix only obvious inconsistencies: seems that there has been
no policy about how a subsystem should print boot/log messages
(subsistem prefix, etc.) nor about the difference between printk(...)
and printk(KERN_WARNING ...), etc. So I did not touch those issues.

The patches regard (mainly) files in arch/i386/kernel.
The patches are based upon 2.6.9-rc4.
The patches have been compile and boot tested.
One file one patch.

Any comment is very welcome.

CC'ed to Ingo Molnar, hoping that's appropriate.

Bye
Daniele Pizzoni <auouo@tin.it>


--===============54989549539190286==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54989549539190286==--
