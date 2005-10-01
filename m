From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 01 Oct 2005 15:19:57 +0000
Subject: [KJ] 2.6.14-rc3-kj1
Message-Id: <20051001151957.GA5148@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18933672482960162=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============18933672482960162==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.14-rc3-kj1 aka "Kaffeine Albatross" is out. You can grab it from
http://coderock.org/kj/2.6.14-rc3-kj1/

Full shortlog is at
http://coderock.org/kj/2.6.14-rc3-kj1/shortlog

New in this release
-------------------
Christophe Lucas
  arch/alpha/kernel/*: use KERN_*       (continued)
  arch/i386/kernel/apic.c: use KERN_*

Dropped
-------
Remove_DRM_ARRAY_SIZE.patch
	DRM people want to keep code of BSD and Linux drivers the same.

Merged
------
drivers_ieee1394_hosts_c_use_time_before.patch


--===============18933672482960162==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18933672482960162==--
