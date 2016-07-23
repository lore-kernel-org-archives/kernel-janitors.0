From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Sat, 23 Jul 2016 22:45:20 +0000
Subject: [PATCH 0/2] drivers: w1: coding style corrections
Message-Id: <1469313922-3453-1-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Coding style corrections for the Dallas 1-wire driver.
Changes made were reported by the checkpatch.pl script.


Ben Werbowyj (2):
  driver: w1: fix quoted strings split across lines
  drivers: w1: fix order of operands in comparisons

 drivers/w1/masters/omap_hdq.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

-- 
2.1.4

