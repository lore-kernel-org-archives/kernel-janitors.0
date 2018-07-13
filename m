From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 15:11:39 +0000
Subject: [PATCH 1/2] samples: bpf: ensure that we don't load over MAX_PROGS programs
Message-Id: <20180713151139.aiqginrahbimfsop@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I can't see that we check prog_cnt to ensure it doesn't go over
MAX_PROGS.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/bpf/bpf_load.c b/samples/bpf/bpf_load.c
index 89161c9ed466..904e775d1a44 100644
--- a/samples/bpf/bpf_load.c
+++ b/samples/bpf/bpf_load.c
@@ -107,6 +107,9 @@ static int load_and_attach(const char *event, struct bpf_insn *prog, int size)
 		return -1;
 	}
 
+	if (prog_cnt = MAX_PROGS)
+		return -1;
+
 	fd = bpf_load_program(prog_type, prog, insns_cnt, license, kern_version,
 			      bpf_log_buf, BPF_LOG_BUF_SIZE);
 	if (fd < 0) {
