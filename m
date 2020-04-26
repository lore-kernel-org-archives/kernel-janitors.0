From: Mao Wenan <maowenan@huawei.com>
Date: Sun, 26 Apr 2020 06:36:33 +0000
Subject: [PATCH bpf-next v3 0/2] Change return code if failed to load
Message-Id: <20200426063635.130680-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, andrii.nakryiko@gmail.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

The first patch change return code from -EINVAL to -EOPNOTSUPP,
the second patch quote the err value returned by bpf_object__load().

v3: delete pr_warn for first patch.
v2: Adjust line breaks at 72 characters for commit log, and pr_warn
alignment as suggested by dan carpenter. For second patch, add
Acked-by tag as well.

Mao Wenan (2):
  bpf: Change error code when ops is NULL
  libbpf: Return err if bpf_object__load failed

 kernel/bpf/syscall.c   | 2 +-
 tools/lib/bpf/libbpf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1
