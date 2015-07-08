From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Jul 2015 16:55:30 +0000
Subject: Re: DRM-vmwgfx: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <559D5602.7070608@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net> <546CCB7E.3050109@users.sourceforge.net>
 <559A35C9.8050201@users.sourceforge.net>
 <CAEG8a3JuM6PDoP8cQ7Wv5um69YoSJHOa5_P7RHbUU8u-Zkvw0w@mail.gmail.com>
In-Reply-To: <CAEG8a3JuM6PDoP8cQ7Wv5um69YoSJHOa5_P7RHbUU8u-Zkvw0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhao Junwang <zhjwpku@gmail.com>
Cc: David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Reviewed-by: Zhao Junwang <zhjwpku@gmail.com> 
> 
> kfree will check that.

How does this feedback fit to a check before a call
of the vfree() function?

Regards,
Markus
