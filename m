From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Jan 2020 16:37:35 +0000
Subject: [RFC] Simplify flush_workqueue/destroy_workqueue pattern
Message-Id: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

According to description of 'destroy_workqueue()':
    "Safely destroy a workqueue. All work currently pending will be done 
first"

Looking deeper at the code, it turns out that the call chain is:
        destroy_workqueue
    --> drain_workqueue
    --> flush_workqueue

So, calling explicitly 'flush_workqueue()' before 'destroy_workqueue()' 
looks redundant.

Using following coccinelle script spots ~90 occurrences, in ~80 files, 
which can be simplified.

 >>>>>>>>>>>>>>>
@r@
expression e;
@@
-    flush_workqueue(e);
      destroy_workqueue(e);
 >>>>>>>>>>>>>>>

This is way to much for me because my patch submission process is mainly 
manual.

If you agree with my analysis, think that removing these redundant calls 
is useful and have a much more automated patch submission process than 
me (or just have time :), please feel free to submit patches.

Best regards,
CJ
