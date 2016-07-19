From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Jul 2016 18:04:58 +0000
Subject: Re: [PATCH] drm/arcpgu: Delete an unnecessary check before drm_fbdev_cma_hotplug_event()
Message-Id: <1468951416.5489.9.camel@synopsys.com>
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
	 <dd9a16b1-234c-6776-e6d9-943a8457334e@users.sourceforge.net>
In-Reply-To: <dd9a16b1-234c-6776-e6d9-943a8457334e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "elfring@users.sourceforge.net" <elfring@users.sourceforge.net>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "julia.lawall@lip6.fr" <julia.lawall@lip6.fr>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>

Hi Markus,

On Fri, 2016-07-15 at 22:00 +-0200, SF Markus Elfring wrote:
+AD4- From: Markus Elfring +ADw-elfring+AEA-users.sourceforge.net+AD4-
+AD4- Date: Fri, 15 Jul 2016 21:52:40 +-0200
+AD4- 
+AD4- The drm+AF8-fbdev+AF8-cma+AF8-hotplug+AF8-event() function tests whether its argument
+AD4- is NULL and then returns immediately.
+AD4- Thus the test around the call is not needed.
+AD4- 
+AD4- This issue was detected by using the Coccinelle software.
+AD4- 
+AD4- Signed-off-by: Markus Elfring +ADw-elfring+AEA-users.sourceforge.net+AD4-

Good catch+ACE-

Acked-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4