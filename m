From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Dec 2017 12:56:09 +0000
Subject: [PATCH][next] netdevsim: make functions nsim_bpf_create_prog and nsim_bpf_destroy_prog static
Message-Id: <20171204125609.5931-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions nsim_bpf_create_prog and nsim_bpf_destroy_prog are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'nsim_bpf_create_prog' was not declared. Should it be static?
symbol 'nsim_bpf_destroy_prog' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/netdevsim/bpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index 8e4398a50903..078d2c37a6c1 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -197,7 +197,7 @@ static int nsim_xdp_set_prog(struct netdevsim *ns, struct netdev_bpf *bpf)
 	return 0;
 }
 
-int nsim_bpf_create_prog(struct netdevsim *ns, struct bpf_prog *prog)
+static int nsim_bpf_create_prog(struct netdevsim *ns, struct bpf_prog *prog)
 {
 	struct nsim_bpf_bound_prog *state;
 	char name[16];
@@ -232,7 +232,7 @@ int nsim_bpf_create_prog(struct netdevsim *ns, struct bpf_prog *prog)
 	return 0;
 }
 
-void nsim_bpf_destroy_prog(struct bpf_prog *prog)
+static void nsim_bpf_destroy_prog(struct bpf_prog *prog)
 {
 	struct nsim_bpf_bound_prog *state;
 
-- 
2.14.1

