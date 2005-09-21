From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 21 Sep 2005 14:53:49 +0000
Subject: [KJ] 2.6.14-rc2-kj1
Message-Id: <20050921145349.GA1897@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57956337481307463=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============57956337481307463==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.14-rc2-kj1 aka "Affine Albatross" is out. You can grab it from
http://coderock.org/kj/2.6.14-rc1-kj1/

Full shortlog is at
http://coderock.org/kj/2.6.14-rc2-kj1/shortlog

Merged
------
kernel_audit_c_fix_sparse_warnings___nocast_type.patch
i386_reboot_c_replace_custom_macro_with_isdigit.patch
remove_arch_arm26_boot_compressed_hw_bse_c.patch

New in this release
-------------------
Christoph Hellwig:
  specialix: check_region/request_region related cleanups

Christophe Lucas:
  arch/alpha/kernel/*: use KERN_*
  	two new files

Dropped
-------
arm_sa1111_c_use_sizeof_pointer.patch
	There was a discussion and much disagreement about sizeof(*p)
	vs sizeof(struct foo) on linux-kernel (grep for "Russell King
	sizeof").
	
	Net result #1: maintainer decides what to put into sizeof.
	Net result #2: kernel janitors won't convert code to either
		       form.

floppy_relocate_devfs_comment.patch
	akpm() returned -ETOOTRIVIAL.

gt96100_stop_using_pci_find_device.patch
	Should be converted to standart PCI API instead.

prism54_use_msleep.patch
	Old patch to use msleep() instead of schedule_timeout(). netdev
	tree switched to schedule_timeout_uninterruptible(). I'll wait
	for API dust to settle.

stir4200_use_set_current_state.patch
	Ditto.


--===============57956337481307463==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57956337481307463==--
