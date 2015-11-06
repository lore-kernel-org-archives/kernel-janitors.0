From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 06 Nov 2015 13:17:05 +0000
Subject: Re: GPU-DRM-i915: Delete an unnecessary check before the function call "pwm_put"
Message-Id: <87egg3l12m.fsf@intel.com>
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
 <5317A59D.4@users.sourceforge.net> <563CA07D.30805@users.sourceforge.net>
 <87h9kzl27o.fsf@intel.com> <563CA349.7030004@users.sourceforge.net>
In-Reply-To: <563CA349.7030004@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 06 Nov 2015, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
>>> The pwm_put() function tests whether its argument is NULL and then
>>> returns immediately. Thus the test around the call is not needed.
>> 
>> The compiler doesn't need it, but IMO it's useful documentation for humans.
>
> How do you think about to extend the explicit documentation for
> the affected parameters in the Linux programming interfaces?

The question is, while reading intel_panel.c, which one conveys the
reader better the idea that panel->backlight.pwm may be NULL for some
connectors:

a)	if (panel->backlight.pwm)
		pwm_put(panel->backlight.pwm);
	
b)	pwm_put(panel->backlight.pwm);

No amount of documentation in pwm_put() kernel-doc is going to help with
that. In most cases, panel->backlight.pwm is in fact NULL. IMO
unconditionally calling pwm_put() on it gives the reader the wrong idea.

Others may disagree.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
