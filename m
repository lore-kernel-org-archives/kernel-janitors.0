From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 06:12:03 +0000
Subject: [PATCH net-next] xdp: sample: Missing curly braces in read_route()
Message-Id: <20171114061202.bzxl6fhw3bdmqp7h@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Christina Jacob <Christina.Jacob@cavium.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The assert statement is supposed to be part of the else branch but the
curly braces were accidentally left off.

Fixes: 3e29cd0e6563 ("xdp: Sample xdp program implementing ip forward")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/bpf/xdp_router_ipv4_user.c b/samples/bpf/xdp_router_ipv4_user.c
index 2c1fe3f4b1a4..916462112d55 100644
--- a/samples/bpf/xdp_router_ipv4_user.c
+++ b/samples/bpf/xdp_router_ipv4_user.c
@@ -206,12 +206,13 @@ static void read_route(struct nlmsghdr *nh, int nll)
 			direct_entry.arp.mac = 0;
 			direct_entry.arp.dst = 0;
 			if (route.dst_len = 32) {
-				if (nh->nlmsg_type = RTM_DELROUTE)
+				if (nh->nlmsg_type = RTM_DELROUTE) {
 					assert(bpf_map_delete_elem(map_fd[3], &route.dst) = 0);
-				else
+				} else {
 					if (bpf_map_lookup_elem(map_fd[2], &route.dst, &direct_entry.arp.mac) = 0)
 						direct_entry.arp.dst = route.dst;
 					assert(bpf_map_update_elem(map_fd[3], &route.dst, &direct_entry, 0) = 0);
+				}
 			}
 			for (i = 0; i < 4; i++)
 				prefix_key->data[i] = (route.dst >> i * 8) & 0xff;
