From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 17:00:24 +0000
Subject: Re: GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <a4bfb464-ff72-5c9c-ab16-e48a9c88bbb9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
 <20170505140916.zoe4sxe3xjtvdlag@art_vandelay>
 <b859d1fb-bdf2-1738-8f28-28a31419b0d1@users.sourceforge.net>
 <20170506123304.2scgonpvt7kjf4cz@art_vandelay>
 <77d74ffc-c833-f7ad-b1e2-5e07ac9d23a7@users.sourceforge.net>
 <20170506152529.7i5zveiob2aaygyl@art_vandelay>
In-Reply-To: <20170506152529.7i5zveiob2aaygyl@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Paul <seanpaul@chromium.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>

>> 1. I suggest to combine a few functions into fewer ones.
>>    * Do you spot any programming mistakes in these concrete cases?
> 
> Not in the patches I skimmed.

Thanks for such feedback.


> However, your history of breaking code tells me that there have been mistakes
> missed in the past.

I admit that I had my own share of software development hiccups. I would also
like to reduce them. But a probability remains that I will stumble on
various glitches as usual.


> As such, I'm not willing to take untested code from you that does not change
> functionality at the risk of breaking something that is currently working.

I imagine that the shown software refactoring will improve the affected
sequence outputs in useful ways, won't it?


> This is non-negotiable.

It seems that we have got different views around the ways to get to acceptable
final system test results.


> As I said before, if you test it, I'll consider it.

I got a few doubts for this information. If you find my software development
reputation so questionable, I assume that you would not trust any tests
that I would try out on my own.


> If you are unwilling to test your changes, I'm unwilling to apply them.

I guess that the desired willingness will depend on a test environment
which will be trusted by all involved parties. Other incentives might
also matter.


> I'm not interested in double checking all of your work, and fixing your bugs
> for no functional benefit.

Do you care for improvements in the implementation of logging functions?


> I find less value in these patches if they're from someone seemingly
> trying to rack up patch count.

I am picking special source code search patterns up.
The evolving development tools can point then hundreds of source files
out which contain similar update candidates.
I found also a few spelling weaknesses while I was looking around
in affected source code. These tools can also increase the awareness
for such change possibilities, can't they?

Regards,
Markus
