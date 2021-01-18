From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 18 Jan 2021 08:00:04 +0000
Subject: [PATCH for bpf-next] docs: bpf: add minimal markup to address doc warning
Message-Id: <20210118080004.6367-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brendan Jackman <jackmanb@google.com>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, netdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 91c960b00566 ("bpf: Rename BPF_XADD and prepare to encode other
atomics in .imm") modified the BPF documentation, but missed some ReST
markup.

Hence, make htmldocs warns on Documentation/networking/filter.rst:1053:

  WARNING: Inline emphasis start-string without end-string.

Add some minimal markup to address this warning.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210118

Brendan, please ack.

Alexei, please pick this minor cleanup patch on your bpf-next.

 Documentation/networking/filter.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index f6d8f90e9a56..45f6fde1776c 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -1048,12 +1048,12 @@ Unlike classic BPF instruction set, eBPF has generic load/store operations::
 Where size is one of: BPF_B or BPF_H or BPF_W or BPF_DW.
 
 It also includes atomic operations, which use the immediate field for extra
-encoding.
+encoding::
 
    .imm = BPF_ADD, .code = BPF_ATOMIC | BPF_W  | BPF_STX: lock xadd *(u32 *)(dst_reg + off16) += src_reg
    .imm = BPF_ADD, .code = BPF_ATOMIC | BPF_DW | BPF_STX: lock xadd *(u64 *)(dst_reg + off16) += src_reg
 
-The basic atomic operations supported are:
+The basic atomic operations supported are::
 
     BPF_ADD
     BPF_AND
-- 
2.17.1
