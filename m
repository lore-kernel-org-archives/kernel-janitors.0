From: Sohny Thomas <sohnythomas@zoho.com>
Date: Wed, 01 Jul 2015 13:56:38 +0000
Subject: [PATCH v2 1/3] Staging: Android: Fixes TODO file
Message-Id: <5593EEC6.4070801@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593E73F.5050607@zoho.com>
In-Reply-To: <5593E73F.5050607@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


- removed non-existent issue from TODO file
kuid_t or uid_t not present in staging/android

Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>
---
drivers/staging/android/TODO | 7 -------
1 file changed, 7 deletions(-)

diff --git a/drivers/staging/android/TODO b/drivers/staging/android/TODO
index 06954cd..b15fb0d 100644
--- a/drivers/staging/android/TODO
+++ b/drivers/staging/android/TODO
@@ -5,13 +5,6 @@ TODO:
- make sure things build as modules properly
- add proper arch dependencies as needed
- audit userspace interfaces to make sure they are sane
- - kuid_t should never be exposed to user space as it is
- kernel internal type. Data structure for this kuid_t is:
- typedef struct {
- uid_t val;
- } kuid_t;
- - This bug is introduced by Xiong Zhou in the patch bd471258f2e09
- - ("staging: android: logger: use kuid_t instead of uid_t")

Please send patches to Greg Kroah-Hartman <greg@kroah.com> and Cc:
Brian Swetland <swetland@google.com>





