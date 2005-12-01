From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Thu, 01 Dec 2005 22:31:29 +0000
Subject: [KJ] [Q] if (x) kfree(x) ?
Message-Id: <003401c5f6c6$f9f30ce0$0100a8c0@bureau>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In many places in the kernel source, piece of code such as the following can
be seen :

in /net/ipv4/ip_sockglue.c
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+   if (msf)
    kfree(msf);
   if (gsf)
    kfree(gsf);
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
or ugglier in /drivers/char/istallion.c
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ if (stli_tmpwritebuf != (char *) NULL)
  kfree(stli_tmpwritebuf);
 if (stli_txcookbuf != (char *) NULL)
  kfree(stli_txcookbuf);
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
The test againt NULL is already done in kfree, so there is aparently no need
to test it before calling kfree. As I don't know if there are another issues
(speed, ...) I just point it out to you and ask if you think it would be a
good idea to remove these tests against NULL from the kernel source.

Any comment ?

CJ



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
