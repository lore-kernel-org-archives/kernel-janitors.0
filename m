From: Masaru Nomura <massa.nomura@gmail.com>
Date: Sun, 18 May 2014 17:19:12 +0000
Subject: [PATCH 0/5] staging: lustre: lnet: klnds: Fix coding style in socklnd.c
Message-Id: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These patches fix warnings below in socklnd.c to meet coding style.
Also fix some indenting due to changes to keep readability.

WARNING: space prohibited between function name and open parenthesis '('
WARNING: line over 80 characters

Masaru Nomura (5):
  staging: lustre: lnet: socklnd: Remove prohibited space
  staging: lustre: lnet: socklnd: Clean up memset(...)
  staging: lustre: lnet: socklnd: Clean up CDEBUG(...)
  staging: lustre: lnet: socklnd: Clean up ksocknal_get_peer_info(...)
  staging: lustre: lnet: socklnd: Clean up ksocknal_create_conn(...)

 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |  242 ++++++++++----------
 1 file changed, 121 insertions(+), 121 deletions(-)

-- 
1.7.9.5

