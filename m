From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 22:13:35 +0000
Subject: [KJ] How to send a patch
Message-Id: <1140732815.12049.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21166275144926772=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21166275144926772==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

i have a few other patches to switch the rest of fs/ to
kzalloc() usage, and I am wondering how to send it.
Since there is always only one file touched in the
subdirectories, so i guess sending them each individually
would be too much overhead. 

Thanks for comments, Eric

 adfs/super.c       |    3 +--
 aio.c              |    3 +--
 autofs/inode.c     |    3 +--
 autofs4/inode.c    |    4 +---
 bfs/inode.c        |    6 ++----
 binfmt_elf.c       |    3 +--
 binfmt_elf_fdpic.c |    3 +--
 bio.c              |    7 ++-----
 char_dev.c         |    7 ++-----
 compat.c           |    3 +--
 cramfs/inode.c     |    3 +--
 devfs/base.c       |    3 +--
 efs/super.c        |    3 +--
 exec.c             |    3 +--
 fat/inode.c        |    3 +--
 file.c             |    3 +--
 hpfs/super.c       |    3 +--
 isofs/inode.c      |    3 +--
 minix/inode.c      |    6 ++----
 ncpfs/inode.c      |    3 +--
 pipe.c             |    3 +--
 qnx4/inode.c       |    3 +--
 reiserfs/file.c    |    3 +--
 super.c            |    3 +--
 sysv/super.c       |    6 ++----
 ufs/super.c        |    3 +--
 26 files changed, 31 insertions(+), 65 deletions(-)



--===============21166275144926772==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21166275144926772==--
