From: Jiri Olsa <olsajiri@gmail.com>
Date: Fri, 14 Mar 2008 13:33:10 +0000
Subject: [PATCH] net: removing unused variable
Message-Id: <47DA7E96.6000704@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

removing unused variable

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 net/packet/af_packet.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index b8b827c..a56ed21 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1658,7 +1658,7 @@ static int packet_set_ring(struct sock *sk, struct tpacket_req *req, int closing
 	int err = 0;
 
 	if (req->tp_block_nr) {
-		int i, l;
+		int i;
 
 		/* Sanity tests and some calculations */
 
@@ -1687,7 +1687,6 @@ static int packet_set_ring(struct sock *sk, struct tpacket_req *req, int closing
 		if (unlikely(!pg_vec))
 			goto out;
 
-		l = 0;
 		for (i = 0; i < req->tp_block_nr; i++) {
 			char *ptr = pg_vec[i];
 			struct tpacket_hdr *header;
