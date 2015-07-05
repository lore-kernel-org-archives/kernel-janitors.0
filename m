From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:15:28 +0000
Subject: [PATCH 00/11] ocfs2: Deletion of some unnecessary checks
Message-Id: <55992DF0.5030205@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>

Further update suggestions were taken into account after two patches
were applied from static source code analysis.

Markus Elfring (11):
  Delete an unnecessary check before unregister_sysctl_table()
  Delete unnecessary checks before the function call "iput"
  Less checks in ocfs2_rename() after error detection
  One check less in ocfs2_statfs()
  Less error log repetition in ocfs2_begin_truncate_log_recovery()
  Two checks less in ocfs2_local_alloc_slide_window()
  Less function calls in ocfs2_shutdown_local_alloc() after error detection
  Less checks in ocfs2_load_local_alloc()
  One function call less in ocfs2_trylock_journal() after error detection
  Less function calls in ocfs2_replay_journal() after error detection
  One function call less in ocfs2_journal_shutdown() from input checks

 fs/ocfs2/alloc.c      | 24 +++++++--------
 fs/ocfs2/ioctl.c      |  4 +--
 fs/ocfs2/journal.c    | 62 +++++++++++++++----------------------
 fs/ocfs2/localalloc.c | 84 +++++++++++++++++++++------------------------------
 fs/ocfs2/namei.c      | 17 +++++------
 fs/ocfs2/slot_map.c   |  3 +-
 fs/ocfs2/stackglue.c  |  3 +-
 fs/ocfs2/super.c      | 22 ++++++--------
 8 files changed, 90 insertions(+), 129 deletions(-)

-- 
2.4.5

