From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 10 Feb 2009 18:43:47 +0000
Subject: [PATCH 0/3] trace: fix sparse warnings
Message-Id: <20090210184214.28131.90564.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fixes some sparse warnings in kernel/trace.

---

Hannes Eder (3):
      trace: fix sparce warning: attribute function with __acquires/__releases
      trace: fix sparse warnings: fix (un-)signedness
      trace: fix sparse warnings: make symbols static


 kernel/trace/ring_buffer.c |    8 ++++----
 kernel/trace/trace.c       |   18 +++++++++++-------
 2 files changed, 15 insertions(+), 11 deletions(-)
