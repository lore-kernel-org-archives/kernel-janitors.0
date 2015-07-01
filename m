From: Sohny Thomas <sohnythomas@zoho.com>
Date: Wed, 01 Jul 2015 13:55:03 +0000
Subject: [PATCH v2 0/3] Staging: android: Fix coding style and TODO file
Message-Id: <5593EE67.8050302@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593E448.70307@zoho.com>
In-Reply-To: <5593E448.70307@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

These set  of patches Fixes the following issues in the android staging driver

- removed non-existent issue from TODO file
kuid_t or uid_t not present in staging/android	
- fixed 80 char limit exceeding line
- a newline after declarations as per checkpatch.pl
- fixed an unnecessary typedef as reported by checkpatch.pl

-Regards,
Sohny



