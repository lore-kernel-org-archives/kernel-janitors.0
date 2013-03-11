From: Mirsal Ennaime <mirsal@mirsal.fr>
Date: Mon, 11 Mar 2013 19:31:51 +0000
Subject: [PATCH 0/4] Cosmetic changes to the android binder proc release code
Message-Id: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

These are cleanup patches related to the binder_deferred_release function
in the android binder staging driver which improve readability while removing
checkpatch and compiler warnings.

 drivers/staging/android/binder.c |  121 +++++++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 44 deletions(-)

Hopefully I have submitted them correctly, this time :)

Thank you for your time and sorry for the noise,
Best regards,

-- 
mirsal


