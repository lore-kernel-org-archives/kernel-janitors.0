From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 25 May 2020 14:15:53 +0000
Subject: [PATCH] MAINTAINERS: adjust entry in XDP SOCKETS to actual file name
Message-Id: <20200525141553.7035-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, Maxim Mikityanskiy <maximmi@mellanox.com>, maciej.fijalkowski@intel.com, bjorn.topel@intel.com, Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 2b43470add8c ("xsk: Introduce AF_XDP buffer allocation API") added a
new header file include/net/xsk_buff_pool.h, but commit 28bee21dc04b
("MAINTAINERS, xsk: Update AF_XDP section after moves/adds") added a file
entry referring to include/net/xsk_buffer_pool.h.

Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:

  warning: no file matches  F:  include/net/xsk_buffer_pool.h

Adjust the entry in XDP SOCKETS to the actual file name.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Bj=C3=B6rn, please pick this minor non-urgent patch.

applies to next-20200525 on top of the commits mentioned above

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a442b48f24b..895c5202fe9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18667,7 +18667,7 @@ L:	netdev@vger.kernel.org
 L:	bpf@vger.kernel.org
 S:	Maintained
 F:	include/net/xdp_sock*
-F:	include/net/xsk_buffer_pool.h
+F:	include/net/xsk_buff_pool.h
 F:	include/uapi/linux/if_xdp.h
 F:	net/xdp/
 F:	samples/bpf/xdpsock*
--=20
2.17.1
