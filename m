From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Feb 2012 21:10:27 +0000
Subject: [PATCH] small speedup in 'nla_strlcpy' in file '\lib\nlattr.c'
Message-Id: <4F3041C3.70607@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I don't know if it worses a patch, but function 'nla_strlcpy' in file 
'\lib\nlattr.c' could be improved a bit.
There is no need to memset(0) the whole buffer. Only the end of it has 
to be cleared.

Usually, 'dstsize' is small (most of the time IFNAMSIZ = 16 bytes), so 
the gain should be real small, if noticeable.

I'm not sure of who to cc: the mail. I've just added Alexey Kuznetsov 
which is one of the author of the modified file and still in the 
MAINTAINERS list.


Hope this helps,
Best regards.

Signed-off-by: Christophe Jaillet<christophe.jaillet@wanadoo.fr>

--- a/lib/nlattr.c    2012-02-06 21:40:04.421875000 +0100
+++ b/lib/nlattr.c    2012-02-06 21:50:43.093750000 +0100
@@ -248,8 +248,8 @@
      if (dstsize > 0) {
          size_t len = (srclen >= dstsize) ? dstsize - 1 : srclen;

-        memset(dst, 0, dstsize);
          memcpy(dst, src, len);
+        memset(dst + len, 0, dstsize - len);
      }

      return srclen;


