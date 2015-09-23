From: Tillmann Heidsieck <theidsieck@leenox.de>
Date: Wed, 23 Sep 2015 20:07:52 +0000
Subject: [PATCH 0/3] staging/wlan-ng: fix buffer overflow and clean up redundant code
Message-Id: <1443038876-15753-1-git-send-email-theidsieck@leenox.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

smatch found a possible buffer overflow in staging/wlan-ng, the first patch
of this series fixes this issue. The remaining two patches clean up
redundant code.

Cheers
Tillmann

Tillmann Heidsieck (3):
  staging: wlan-ng fix buffer overflow in firmware handling
  staging: wlan-ng remove redundant conditional
  staging: wlan-ng remove unnessecary variable

 drivers/staging/wlan-ng/prism2fw.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.5.3

