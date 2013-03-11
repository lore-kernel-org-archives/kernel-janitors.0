From: Mirsal Ennaime <mirsal@mirsal.fr>
Date: Mon, 11 Mar 2013 23:26:25 +0000
Subject: [PATCH v2 0/3] Cosmetic changes to the android binder proc release code
Message-Id: <1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>

Hello,

These are cleanup patches related to the binder_deferred_release function
in the android binder staging driver which improve readability while removing
checkpatch and compiler warnings.

 drivers/staging/android/binder.c |  137 +++++++++++++++++-----------
 1 file changed, 85 insertions(+), 52 deletions(-)

Changes from v1:

 * squashed patches 3 and 4 together instead of introducing a warning
   in patch 3 and then fix it in patch 4. (Following Joe Perches' review)
 * removed the extra nd_refs variable from patch 1 and fixed whitespace
   in patch 2 (Following Dan Carpenter's reviews)

Thank you for your time and sorry again for the noise,
Best regards,

--
mirsal

