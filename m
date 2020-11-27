From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 27 Nov 2020 09:34:21 +0000
Subject: [PATCH] net/ipv6: propagate user pointer annotation
Message-Id: <20201127093421.21673-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

For IPV6_2292PKTOPTIONS, do_ipv6_getsockopt() stores the user pointer
optval in the msg_control field of the msghdr.

Hence, sparse rightfully warns at ./net/ipv6/ipv6_sockglue.c:1151:33:

  warning: incorrect type in assignment (different address spaces)
      expected void *msg_control
      got char [noderef] __user *optval

Since commit 1f466e1f15cf ("net: cleanly handle kernel vs user buffers for
->msg_control"), user pointers shall be stored in the msg_control_user
field, and kernel pointers in the msg_control field. This allows to
propagate __user annotations nicely through this struct.

Store optval in msg_control_user to properly record and propagate the
memory space annotation of this pointer.

Note that msg_control_is_user is set to true, so the key invariant, i.e.,
use msg_control_user if and only if msg_control_is_user is true, holds.

The msghdr is further used in the six alternative put_cmsg() calls, with
msg_control_is_user being true, put_cmsg() picks msg_control_user
preserving the __user annotation and passes that properly to
copy_to_user().

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Christoph, please review and ack.

David, Alexey, Hideaki-san, Jakub,
  please pick this minor non-urgent clean-up patch.

 net/ipv6/ipv6_sockglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index 43a894bf9a1b..a6804a7e34c1 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -1148,7 +1148,7 @@ static int do_ipv6_getsockopt(struct sock *sk, int level, int optname,
 		if (sk->sk_type != SOCK_STREAM)
 			return -ENOPROTOOPT;
 
-		msg.msg_control = optval;
+		msg.msg_control_user = optval;
 		msg.msg_controllen = len;
 		msg.msg_flags = flags;
 		msg.msg_control_is_user = true;
-- 
2.17.1
