From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:34:51 +0000
Subject: [PATCH 0/7] ocfs2: Deletion of some unnecessary checks
Message-Id: <54E8DDDB.9020902@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 20:15:16 +0100

Further update suggestions were taken into account after a patch was applied
from static source code analysis.

Markus Elfring (7):
  Deletion of unnecessary checks before three function calls
  Less function calls in ocfs2_convert_inline_data_to_extents()
    after error detection
  Less function calls in ocfs2_figure_merge_contig_type()
    after error detection
  One function call less in ocfs2_merge_rec_left()
    after error detection
  One function call less in ocfs2_merge_rec_right()
    after error detection
  One function call less in ocfs2_init_slot_info()
    after error detection
  One function call less in user_cluster_connect()
    after error detection

 fs/ocfs2/alloc.c      | 48 ++++++++++++++++++++++--------------------------
 fs/ocfs2/slot_map.c   |  4 ++--
 fs/ocfs2/stack_user.c |  8 +++-----
 3 files changed, 27 insertions(+), 33 deletions(-)

-- 
2.3.0

