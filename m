From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 10:20:11 +0000
Subject: [PATCH 0/6] [media] omap_vout: Adjustments for three function implementations
Message-Id: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Muralidharan Karicheri <mkaricheri@gmail.com>, Vaibhav Hiremath <hvaibhav@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 12:06:54 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Delete an error message for a failed memory allocation in omap_vout_create_video_devices()
  Improve a size determination in two functions
  Adjust a null pointer check in two functions
  Fix a possible null pointer dereference in omap_vout_open()
  Delete an unnecessary variable initialisation in omap_vout_open()
  Delete two unnecessary variable initialisations in omap_vout_probe()

 drivers/media/platform/omap/omap_vout.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

-- 
2.14.1

