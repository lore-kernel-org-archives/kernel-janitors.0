From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 Jan 2011 20:37:55 +0000
Subject: [patch] phonet: some signedness bugs
Message-Id: <20110107203755.GB1959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Remi Denis-Courmont <remi.denis-courmont@nokia.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

Dan Rosenberg pointed out that there were some signed comparison bugs
in the phonet protocol.

http://marc.info/?l=full-disclosure&m9424528425330&w=2

If you have already have CAP_SYS_ADMIN then you could use the bugs to
get root, or someone could cause an oops by mistake.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/include/net/phonet/phonet.h b/include/net/phonet/phonet.h
index d5df797..5395e09 100644
--- a/include/net/phonet/phonet.h
+++ b/include/net/phonet/phonet.h
@@ -107,8 +107,8 @@ struct phonet_protocol {
 	int			sock_type;
 };
 
-int phonet_proto_register(int protocol, struct phonet_protocol *pp);
-void phonet_proto_unregister(int protocol, struct phonet_protocol *pp);
+int phonet_proto_register(unsigned int protocol, struct phonet_protocol *pp);
+void phonet_proto_unregister(unsigned int protocol, struct phonet_protocol *pp);
 
 int phonet_sysctl_init(void);
 void phonet_sysctl_exit(void);
diff --git a/net/phonet/af_phonet.c b/net/phonet/af_phonet.c
index fd95beb..c627d2e 100644
--- a/net/phonet/af_phonet.c
+++ b/net/phonet/af_phonet.c
@@ -37,7 +37,7 @@
 /* Transport protocol registration */
 static struct phonet_protocol *proto_tab[PHONET_NPROTO] __read_mostly;
 
-static struct phonet_protocol *phonet_proto_get(int protocol)
+static struct phonet_protocol *phonet_proto_get(unsigned int protocol)
 {
 	struct phonet_protocol *pp;
 
@@ -60,8 +60,8 @@ static inline void phonet_proto_put(struct phonet_protocol *pp)
 
 /* protocol family functions */
 
-static int pn_socket_create(struct net *net, struct socket *sock, int protocol,
-			    int kern)
+static int pn_socket_create(struct net *net, struct socket *sock,
+			    unsigned int protocol, int kern)
 {
 	struct sock *sk;
 	struct pn_sock *pn;
@@ -458,7 +458,7 @@ static struct packet_type phonet_packet_type __read_mostly = {
 
 static DEFINE_MUTEX(proto_tab_lock);
 
-int __init_or_module phonet_proto_register(int protocol,
+int __init_or_module phonet_proto_register(unsigned int protocol,
 						struct phonet_protocol *pp)
 {
 	int err = 0;
@@ -481,7 +481,7 @@ int __init_or_module phonet_proto_register(int protocol,
 }
 EXPORT_SYMBOL(phonet_proto_register);
 
-void phonet_proto_unregister(int protocol, struct phonet_protocol *pp)
+void phonet_proto_unregister(unsigned int protocol, struct phonet_protocol *pp)
 {
 	mutex_lock(&proto_tab_lock);
 	BUG_ON(proto_tab[protocol] != pp);
