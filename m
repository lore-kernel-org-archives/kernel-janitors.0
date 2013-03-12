From: Mirsal Ennaime <mirsal@mirsal.fr>
Date: Tue, 12 Mar 2013 10:41:58 +0000
Subject: [PATCH v3 0/4] Cosmetic changes to the android binder proc release code
Message-Id: <1363084922-19698-1-git-send-email-mirsal@mirsal.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>

Hello,

These are cleanup patches related to the binder_deferred_release function
in the android binder staging driver which improve readability while removing
checkpatch and compiler warnings.

 drivers/staging/android/binder.c |  138 +++++++++++++++++-----------
 1 file changed, 84 insertions(+), 54 deletions(-)

Changes from v1:

 * squashed patches 3 and 4 together instead of introducing a warning
   in patch 3 then fix it in patch 4. (Following Joe Perches' review)
 * removed the extra nd_refs variable from patch 1 and fixed whitespace
   in patch 2 (Following Dan Carpenter's reviews)
 * renamed the new binder_node_release_deferred function to a shorter
   binder_node_release as releasing a node will allways be deferred

Changes from v2

 * kept arguments aligned with parentesis (Following
   Arve Hjønnevåg's review)
 * added a fourth patch which removes function names from string litterals
   in favor __func__ (Following Dan Carpenter's review)
 * improved commit log messages slightly

Please excuse my wasting of your time for such trivia.
I do want to get the basics of submitting patches right
before starting any heavier lifting.

Thank you for your time and sorry again for the noise,
Best regards,

--
mirsal

