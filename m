From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Nov 2014 08:19:37 +0000
Subject: [PATCH 0/3] [media] DVB-frontends: Deletion of a few unnecessary checks
Message-Id: <546DA419.7050405@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Nov 2014 23:30:37 +0100

Another update suggestion was taken into account after a patch was applied
from static source code analysis.

Markus Elfring (3):
  DVB-frontends: Deletion of unnecessary checks before the function
    call "release_firmware"
  m88ds3103: One function call less in m88ds3103_init() after error detection
  si2168: One function call less in si2168_init() after error detection

 drivers/media/dvb-frontends/drx39xyj/drxj.c |  3 +--
 drivers/media/dvb-frontends/drxk_hard.c     |  3 +--
 drivers/media/dvb-frontends/m88ds3103.c     | 12 ++++++------
 drivers/media/dvb-frontends/si2168.c        | 10 +++++-----
 4 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.1.3

