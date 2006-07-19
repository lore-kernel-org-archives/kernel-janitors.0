From: "tom hisch" <t.hisch@gmail.com>
Date: Wed, 19 Jul 2006 17:08:22 +0000
Subject: [KJ] arch/i386/kernel/bootflag.c : remove sbf_port == -1 statement ?
Message-Id: <8ef77f2e0607191008u29f55144n26eaaac6e8f206ff@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

hi,

is it possible that sbf_port is altered after acpi_boot_init() ?

if not, should the sbf_port =3D -1 statement in line 44 and 66 be
removed because sbf_port is already checked in the init function (line
82) ??

http://kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dblob=
;h=0B9860530a6ba760385510569b2388f3409c9d12;hb=82d6897fefca6206bca7153805b4=
c5359ce97fc4;f=3Darch/i386/kernel/bootflag.c

- Thomas Hisch
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
