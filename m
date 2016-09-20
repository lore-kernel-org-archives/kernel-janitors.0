From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 10:32:43 +0000
Subject: Re: GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_data()
Message-Id: <e5062794-7d14-f4dc-2995-949f84b62810@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
 <87shsulw9k.fsf@intel.com>
In-Reply-To: <87shsulw9k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> A single error message should be sufficient to inform about
>> the detection of an unknown GCT revision at the end.
>> Thus return after the logging call in this case directly.
> 
> Did you test this?

What is your software development opinion for this update suggestion?

Regards,
Markus
