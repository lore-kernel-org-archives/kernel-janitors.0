From: jolsa@redhat.com
Date: Thu, 16 Jul 2009 19:44:25 +0000
Subject: [PATCH 0/3] tracing: minor bugs
Message-Id: <1247773468-11594-1-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@elte.hu, rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

1/3 - removing not used variables
2/3 - removing struct module* parameter from ftrace_init_module code path
3/3 - removing .globl in the scripts/recordmcount.pl doc

based on Linus tree commit 35b5c55fee08e6e4001ba98060a2d0b82f70b5f4 

wbr,
jirka
