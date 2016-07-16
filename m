From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 14:33:18 +0000
Subject: [PATCH 0/8] drm/amdgpu: Fine-tuning for three function implementations
Message-Id: <d46343aa-7641-2e77-a4dc-634c527c182b@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net> <558FB427.80103@users.sourceforge.net>
In-Reply-To: <558FB427.80103@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 16:23:21 +0200

Further update suggestions were taken into account after patches
were applied from static source code analysis.

Markus Elfring (8):
  Delete an unnecessary check before drm_gem_object_unreference_unlocked()
  Delete unnecessary checks before the function call "kfree"
  One function call less in amdgpu_cgs_acpi_eval_object() after error detection
  Delete a variable in amdgpu_cgs_acpi_eval_object()
  Delete an unnecessary variable initialisation in amdgpu_cgs_acpi_eval_object()
  Change assignment for a variable in amdgpu_cgs_acpi_eval_object()
  Change assignment for a buffer variable in phm_dispatch_table()
  Delete an unnecessary variable initialisation in phm_dispatch_table()

 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            | 28 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  4 +---
 .../gpu/drm/amd/powerplay/hwmgr/functiontables.c   | 12 ++++------
 3 files changed, 19 insertions(+), 25 deletions(-)

-- 
2.9.1

