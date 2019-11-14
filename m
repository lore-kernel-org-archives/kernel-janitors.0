From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 14 Nov 2019 03:43:51 +0000
Subject: [PATCH net] bpf: doc: change right arguments for JIT example code
Message-Id: <20191114034351.162740-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, davem@davemloft.net, corbet@lwn.net
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

The example codes for JIT of x86_64, use wrong
arguments to when call function bar().

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 Documentation/networking/filter.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index 319e5e0..c4a328f 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -770,10 +770,10 @@ Some core changes of the new internal format:
     callq foo
     mov %rax,%r13
     mov %rbx,%rdi
-    mov $0x2,%esi
-    mov $0x3,%edx
-    mov $0x4,%ecx
-    mov $0x5,%r8d
+    mov $0x6,%esi
+    mov $0x7,%edx
+    mov $0x8,%ecx
+    mov $0x9,%r8d
     callq bar
     add %r13,%rax
     mov -0x228(%rbp),%rbx
-- 
2.7.4
