From: Rafael Pereira <rafael@kernelhacker.net>
Date: Tue, 18 Jan 2005 00:26:29 +0000
Subject: [KJ] [PATCH] printk function
Message-Id: <1106007989.20867.17.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43876126707866447=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106001987.20867.6.camel@localhost.localdomain>
In-Reply-To: <1106001987.20867.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============43876126707866447==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The patch for the printk function. I found more than 20k occurences that
needs modification, to include KERN_* constants. There're lots of
changes to be done.

http://www.kernelhacker.net/patch/patch-2.6.11-rc1-printk.tar.bz2




-- 
 Rafael Pereira
 GNU/Linux Registered User #286151
 BSD Registered User #51196
 Be free. Use free software.


--===============43876126707866447==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43876126707866447==--
