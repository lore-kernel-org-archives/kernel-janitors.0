From: Sean Paul <seanpaul@chromium.org>
Date: Sat, 06 May 2017 12:33:04 +0000
Subject: Re: GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <20170506123304.2scgonpvt7kjf4cz@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
 <20170505140916.zoe4sxe3xjtvdlag@art_vandelay>
 <b859d1fb-bdf2-1738-8f28-28a31419b0d1@users.sourceforge.net>
In-Reply-To: <b859d1fb-bdf2-1738-8f28-28a31419b0d1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>

On Fri, May 05, 2017 at 05:04:40PM +0200, SF Markus Elfring wrote:
> > It seems like you're back to submitting cocci patches again :)
> 
> My contribution activities are varying also for Linux software over time.   ;-)
> 
> The corresponding source code search patterns get different popularity.
> 
> 
> > I don't want to waste your time by ignoring your patches, so please ensure that
> > your patches provide value and that they are tested.
> 
> Which benchmarks and system tests would you find representative for this patch series?
> 

Given your history of submitting changes which break working code, I want
assurance that you've actually run the code and verified that it does what you
want it to do.

> How do you think generally about the proposed change possibilities?

Generally speaking, I don't care about checkpatch/cocci changes that aren't
tested. They clutter the log and don't provide enough value to justify the risk
of breaking stuff. 

IMO, the only time this would be acceptable is if a new contributor wanted to
wet their feet with a couple cleanup patches before diving in to actual
functional changes. In that case, I wouldn't mind dealing with breakage since
we'll benefit from their contributions in the future. With your changes, we
don't have this upside.

Sean


> 
> Regards,
> Markus

-- 
Sean Paul, Software Engineer, Google / Chromium OS
