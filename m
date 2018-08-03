From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 14:35:57 +0000
Subject: [PATCH 0/4] Trival spelling mistake fixes
Message-Id: <20180803143601.4211-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Four Trival spelling mistake fixes

Colin Ian King (4):
  media: au0828: fix spelling mistake: "completition" -> "completion"
  media: cx231xx: fix spelling mistake: "completition" -> "completion"
  media: dvb-usb-v2: fix spelling mistake: "completition" ->
    "completion"
  media: dvb-usb: fix spelling mistake: "completition" -> "completion"

 drivers/media/usb/au0828/au0828-video.c   | 2 +-
 drivers/media/usb/cx231xx/cx231xx-audio.c | 4 ++--
 drivers/media/usb/cx231xx/cx231xx-vbi.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/usb_urb.c    | 4 ++--
 drivers/media/usb/dvb-usb/usb-urb.c       | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

