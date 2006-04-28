From: Henne <henne@nachtwindheim.de>
Date: Fri, 28 Apr 2006 07:08:59 +0000
Subject: [KJ] post 2.6.17-rc3 "Stop adding device ids to
Message-Id: <4451BF8B.5030707@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi there!

I've seen a change in the Documentation/pci.txt

http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commitdiff;h=9B860b8c4bde5949b272968597d1426d53080532

Does that really mean, that no Device-ID's should be added or should they b=
e removed from include/linux/pci_ids.h?
They could be replaced in the drivers, if they are used e.g. max 2 times, w=
ith the constant values or if they are used
more than 2 times (for drivers who support more devices and check that) mov=
ed only to them.

I would write patches if this is in the sense of that.

Greets,
Henne

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
