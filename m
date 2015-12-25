From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Dec 2015 16:00:30 +0000
Subject: sata_mv: Another source code review around exception handling?
Message-Id: <567D681E.7050903@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ide@vger.kernel.org, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello,

I have looked at the source file for the Marvell SATA support driver once m=
ore.
I would appreciate if a specific implementation detail can be clarified the=
re.

Static source code analysis can point out that functions like the following
are called by the mv_platform_probe() function.
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/ata/sata_mv.c?id=80c75a0f1d81922bf322c0634d1e1a15825a89e6#n4055

* ata_host_alloc_pinfo
  http://lxr.free-electrons.com/source/drivers/ata/libata-core.c?v=3D4.3#L5=
768

* devm_kzalloc
  http://lxr.free-electrons.com/source/include/linux/device.h?v=3D4.3#L645


The value "-ENOMEM" will be returned if one of these function calls failed.
Can it be that any system resources (like memory) are not appropriately
released if any calls of this sequence succeeded before the failure?


Is the use of the single jump label "err" also suspicious here?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
