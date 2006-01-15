From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Sun, 15 Jan 2006 03:36:06 +0000
Subject: [KJ] Fw: Suggested janitor task - remove __init/__exit from function
Message-Id: <20060114193606.0a0a8162.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43364785731966404=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43364785731966404==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Alexey, comments/thoughts?


Begin forwarded message:

Date: Sun, 15 Jan 2006 13:11:35 +1100
From: Keith Owens <kaos@ocs.com.au>
To: linux-kernel@vger.kernel.org
Subject: Suggested janitor task - remove __init/__exit from function prototypes


Some function prototypes (in both .h and .c files) specify attributes
like __init and __exit in the prototype.  gcc (at least at 3.3.3) uses
the last such attribute that is actually specified, without issuing a
warning.  So we can have :-

* Prototype declarations that use one attribute and a function body
  that uses another attribute.

* Functions that from the .c code appear to be normal text but the .h
  file is silently setting a special attribute.

Both are potential sources of programmer confusion or bugs.  I suggest
a janitor task to find all function prototypes that use __init, __exit,
__devinit, __devexit, __cpuinit or __cpuexit and remove the attribute
from the prototype.  If the function body does not already specify a
suitable attribute then add the attribute to the function body.

The same task could be done for extern data declarations.

Once that is done, remove #include <linux/init.h> from all .h files.
Only .[cS] files should specify which section the data and text are
stored in, .h files should only define the C language information.

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/



---
~Randy

--===============43364785731966404==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43364785731966404==--
