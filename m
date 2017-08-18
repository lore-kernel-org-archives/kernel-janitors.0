From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Aug 2017 07:27:02 +0000
Subject: [PATCH net-next] bpf: fix a return in sockmap_get_from_fd()
Message-Id: <20170818071210.wyq37kura6wz6bx6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"map" is a valid pointer.  We wanted to return "err" instead.  Also
let's return a zero literal at the end.

Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index d2f2bdf71ffa..b8cb1b3c9bfb 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1125,11 +1125,11 @@ static int sockmap_get_from_fd(const union bpf_attr *attr, int ptype)
 		fdput(f);
 		bpf_prog_put(prog1);
 		bpf_prog_put(prog2);
-		return PTR_ERR(map);
+		return err;
 	}
 
 	fdput(f);
-	return err;
+	return 0;
 }
 
 static int bpf_prog_attach(const union bpf_attr *attr)
