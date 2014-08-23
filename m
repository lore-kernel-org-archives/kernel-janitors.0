From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 18:33:21 +0000
Subject: [PATCH 0/7] delete double assignment
Message-Id: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org

These patches fix cases where there are two adjacent assignments to the
same location.  In practice, many such occurrences appear to be
intentional, eg to initialize volatile memory, but these cases do not seem
to fall into that category.

The complete semantic match that finds these problems is as follows:

// <smpl>
@r@
expression i,f;
position p1,p2;
@@

(
 i = <+...f(...)...+>;
|
 i |= <+...f(...)...+>;
|
 i &= <+...f(...)...+>;
|
 i += <+...f(...)...+>;
|
 i -= <+...f(...)...+>;
|
 i *= <+...f(...)...+>;
|
 i /= <+...f(...)...+>;
|
 i %= <+...f(...)...+>;
|
 i ^= <+...f(...)...+>;
|
 i <<= <+...f(...)...+>;
|
 i >>= <+...f(...)...+>;
|
 i@p1 = ...;
|
 i@p1 |= ...;
|
 i@p1 &= ...;
|
 i@p1 += ...;
|
 i@p1 -= ...;
|
 i@p1 *= ...;
|
 i@p1 /= ...;
|
 i@p1 %= ...;
|
 i@p1 ^= ...;
|
 i@p1 <<= ...;
|
 i@p1 >>= ...;
|
 i@p1 ++;
|
 ++i@p1;
|
 i@p1 --;
|
 --i@p1;
)
(
 i = <+...i...+>;
|
 i = <+...f(...)...+>;
|
 i@p2 = ...;
)

@@
expression i,j,f;
position r.p1,r.p2;
@@

(
 (<+...i@p1...+>);
)
(
 (<+...\(j++\|++j\|j--\|--j\|f(...)\)...+>) = ...;
|
*i@p2 = ...;
)
// </smpl>

