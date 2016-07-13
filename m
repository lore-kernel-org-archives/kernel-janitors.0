From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Jul 2016 17:54:56 +0000
Subject: [PATCH 0/3] drm/msm: Deletion of a few unnecessary checks
Message-Id: <351a1279-b0ca-5f5e-d175-28c9de8406f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Jul 2016 19:46:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  HDMI: Delete an unnecessary check before the function call "kfree"
  Delete unnecessary checks before drm_gem_object_unreference_unlocked()
  Delete an unnecessary check before drm_gem_object_unreference()

 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c    | 2 +-
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c | 3 +--
 drivers/gpu/drm/msm/msm_fb.c            | 4 ++--
 drivers/gpu/drm/msm/msm_gem.c           | 8 ++------
 4 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.9.0

