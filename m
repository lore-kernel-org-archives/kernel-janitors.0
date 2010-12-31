From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 19:28:28 +0000
Subject: [PATCHv2] staging: keucr: Use memcmp() & memcpy() instead of custom String[Cmp|Copy] functions
Message-Id: <1293823712-6273-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patchset make some cleanup to staging/keucr. Use memcmp and memcpy instead of custom functions.
Also some style cleanups.

The patches in this patchset are the following:

[PATCH 1/2] staging: keucr: Use memcmp() instaed of custom StringCmp() and some style cleanups
[PATCH 2/2] staging: keucr: Use memcpy() instad of custom StringCopy() and some style cleanups
[PATCH 3/4] staging: keucr: Delete StringCmp() and StringCopy custom functions
[PATCH 4/4] staging: keucr: Delete use kernel strcmp() & strcpy() from TODO file

