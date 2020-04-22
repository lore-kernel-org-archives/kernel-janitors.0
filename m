From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 22 Apr 2020 08:30:08 +0000
Subject: [PATCH bpf-next 0/2] Change return code if failed to load object
Message-Id: <20200422083010.28000-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The first patch change return code from -EINVAL to -EOPNOTSUPP, 
the second patch quote the err value returned by bpf_object__load().  

Mao Wenan (2):
  bpf: Change error code when ops is NULL
  libbpf: Return err if bpf_object__load failed

 kernel/bpf/syscall.c   | 8 +++++---
 tools/lib/bpf/libbpf.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.20.1
