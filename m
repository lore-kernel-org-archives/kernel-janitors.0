From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 21 Feb 2009 01:11:16 +0000
Subject: [PATCH 0/2] GFS2: fix sparse warnings
Message-Id: <20090221011033.5075.95929.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fixes some sparse warnings in GFS2.

---

Hannes Eder (2):
      GFS2: fix sparse warning: Should it be static?
      GFS2: fix sparse warnings: constant is so big it is ...


 fs/gfs2/rgrp.c |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)
