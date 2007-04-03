From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 03 Apr 2007 07:26:43 +0000
Subject: [KJ] Any need for __cplusplus?
Message-Id: <461201B3.8000800@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello

There were recently a thread in LKML about C++-usage in the kernel (again).
That reminded me, why do we have those "ifdef __cplusplus"? As an 
example, we have this (in include/linux/stddef.h) when defining NULL as 
0 in C++ and ((void *)0) otherwise. From what I can see, there is no
reason to have them, or am I missing something? (like they are needed by
libraries)

> grep -nr cplusplus * | wc -l
121

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
