From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Tue, 03 Oct 2006 06:30:19 +0000
Subject: [KJ] memory leak?
Message-Id: <80ec54e90610022330h5fea626aha58011043899dd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello friends!

I believe I have found a memory leak. Can somebody please verify
before I submit it in the bugs database?

Kernel: 2.6.18

In linux/drivers/block/cpqarray.c:  ida_ctlr_ioctl
I believe the pointer "p" can cause a memory leak.
Check out "switch(io->cmd)" at the end of the function. All cases
except "default" will cause p to be deallocated.

Best regards,
Daniel Marjam=E4ki

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
