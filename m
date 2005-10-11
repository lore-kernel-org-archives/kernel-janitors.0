From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 11 Oct 2005 17:55:23 +0000
Subject: [KJ] 2.6.14-rc4-kj1
Message-Id: <20051011175523.GA2367@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69843021242639525=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============69843021242639525==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.14-rc4-kj1 aka "I ran out of bad ideas" patchset is out. You can
get it from usual place: http://coderock.org/kj/2.6.14-rc4-kj1/

Full shortlog of who did what is also available:
http://coderock.org/kj/2.6.14-rc4-kj1/shortlog

* __nocast patches were reworked to use gfp_t facility. Hmm... subject
  lines were left intact.
* ext3 + CONFIG_QUOTA=n patch was merged and dropped in between.

It's nice to see new people sending small things to our list.

New in this release
-------------------
Aaron Grothe
  Remove unreachable code

Alexey Dobriyan
  Remove select_bits_alloc(), select_bits_free()
  cris: kgdb: remove double_this()

Anton Brondz
  arch/i386/kernel/irq.c: use KERN_*

Felix Oxley
  fs/jffs/intrep.c: 255 is unsigned char

Irwan Djajadi
  pcf8563: remove MOD_INC/DEC_USE_COUNT
  hotkey.c: fix memory leak on exit path

Jerome Pinot
  s/HANGUEL/HANGEUL/

Milind A Choudhary
  kernel/timer.c: use KERN_WARNING

Masoud A Sharbiani
  kernel/audit.o: make size smaller
  hexdigits definition consolidation

Merged
------
sungem_fix_nocast_type_warnings.patch
ns83820_fix_nocast_type_warnings.patch
bond_main_c_fix_nocast_type_warnings.patch


--===============69843021242639525==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69843021242639525==--
