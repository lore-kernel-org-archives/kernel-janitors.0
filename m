From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 09:19:20 +0000
Subject: [PATCH] staging: keucr: Use strncmp() & strncpy() instead of custom functions
Message-Id: <1293787164-7056-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patchset make some cleanup to staging/keucr. Use strncmp and strncpy instad of custom functions.
Also some style cleanups.

The patches contained in this patchset are the following:

[PATCH 1/4] staging: keucr: Use strncmp() instead of custom StringCmp() and some style cleanups
[PATCH 2/4] staging: keucr: Use strncpy() instead of custom StringCopy() and some style cleanups
[PATCH 3/4] staging: keucr: Delete custom StringCmp() and StringCopy() functions
[PATCH 4/4] staging: keucr: Delete use kernel strcmp() & strcpy() from TODO file
