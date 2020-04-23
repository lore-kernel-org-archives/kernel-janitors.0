From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 23 Apr 2020 03:33:12 +0000
Subject: [PATCH bpf-next v2 0/2] Change return code if failed to load object
Message-Id: <20200423033314.49205-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422093329.GI2659@kadam>
In-Reply-To: <20200422093329.GI2659@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com, andrii.nakryiko@gmail.com

The first patch change return code from -EINVAL to -EOPNOTSUPP,
the second patch quote the err value returned by bpf_object__load().

v2: Adjust line breaks at 72 characters for commit log, and pr_warn alignment as suggested by dan carpenter. For second patch, add Acked-by tag as well.

Mao Wenan (2):
  bpf: Change error code when ops is NULL
  libbpf: Return err if bpf_object__load failed

 kernel/bpf/syscall.c   | 7 ++++---
 tools/lib/bpf/libbpf.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.20.1
