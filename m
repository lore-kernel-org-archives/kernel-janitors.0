From: Daniele Pizzoni <auouo@tin.it>
Date: Thu, 14 Oct 2004 21:45:27 +0000
Subject: [KJ] new janitor info
Message-Id: <1097793530.5995.47.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70450246292181684=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70450246292181684==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello!

I'd like to start doing some work as janitor, I'm not exactly an
absolute kernel newbie (some simple driver hacking experience), but I'd
like to start with simple things just to start getting involved.

I had a look at the TODO list on janitor.kernelnewbies.org. I think I
could to start with something from the following list:

----8<--------8<--------8<--------8<--------8<--------8<----

From: Andrey Panin <pazke at orbita dot don dot sitek dot net>

- check printk() calls (should include appropriate KERN_* constant).

------------------------------------------------------------------------
From Domen Puncer:
- pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
- same for pr_info()

------------------------------------------------------------------------
From Domen Puncer:
- min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.

------------------------------------------------------------------------
From Domen Puncer:
- remove string concatenation with __FUNCTION__ (get rid of
warnings, and get ready for __func__):
-printk(KERN_INFO "blabla " __FUNCTION__ "\n");
+printk(KERN_INFO "blabla %s\n", __FUNCTION__);

However, do not convert _FUNCTION_ to _func_ because older
gcc versions do not support _func_.

----8<--------8<--------8<--------8<--------8<--------8<----


Anyway I'd like to know if the someone is already working on the same
topics.

Also, are patches to be sent to the kernel-janitors list only?

Thanks for you help, beware of the many questions I'm going to ask you!
:)

Bye
Daniele Pizzoni



--===============70450246292181684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70450246292181684==--
