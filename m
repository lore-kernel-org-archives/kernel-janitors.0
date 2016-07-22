From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Fri, 22 Jul 2016 04:33:32 +0000
Subject: [PATCH 0/3] drivers: w1: coding style corrections
Message-Id: <1469162015-10497-1-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Coding style corrections for the Dallas 1-Wire driver.
Sections changed were reported by checkpatch.pl script.
Broken up into separate patches to hopefully make checking/review
a little easier. All three patches are for the w1_therm.c file

Ben Werbowyj (3):
  drivers: w1: style corrections for parenthesis and braces
  drivers: w1: removed assignment from within if statement
  drivers: w1: style corrections-pointers-blanklines-comparisons

 drivers/w1/slaves/w1_therm.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.1.4

