From: Sean Paul <seanpaul@chromium.org>
Date: Sat, 06 May 2017 15:25:29 +0000
Subject: Re: GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <20170506152529.7i5zveiob2aaygyl@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
 <20170505140916.zoe4sxe3xjtvdlag@art_vandelay>
 <b859d1fb-bdf2-1738-8f28-28a31419b0d1@users.sourceforge.net>
 <20170506123304.2scgonpvt7kjf4cz@art_vandelay>
 <77d74ffc-c833-f7ad-b1e2-5e07ac9d23a7@users.sourceforge.net>
In-Reply-To: <77d74ffc-c833-f7ad-b1e2-5e07ac9d23a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>

On Sat, May 06, 2017 at 03:54:51PM +0200, SF Markus Elfring wrote:
> > Generally speaking, I don't care about checkpatch/cocci changes that aren't tested.
> 
> I find this view interesting only to some degree.

We're bordering on becoming unproductive here, but I'll try once more.

> 
> 1. I suggest to combine a few functions into fewer ones.
>    * Do you spot any programming mistakes in these concrete cases?

Not in the patches I skimmed. However, your history of breaking code tells me that
there have been mistakes missed in the past. As such, I'm not willing to take
untested code from you that does not change functionality at the risk of
breaking something that is currently working. This is non-negotiable.

>    * Can such code reduction result into desired effects?
> 
> 2. I propose to use the function “seq_putc” at more source code places.
>    * Do you really find any previous system test approaches insufficient around
>      such a Linux feature?
>    * Does the programming interface “seq_puts” provide any properties
>      that you prefer over the other one for the sequence output of single characters?
>      http://elixir.free-electrons.com/linux/v4.11/source/fs/seq_file.c#L664
> 

As I said before, if you test it, I'll consider it. If you are unwilling to test
your changes, I'm unwilling to apply them. I'm not interested in double checking
all of your work, and fixing your bugs for no functional benefit.

> 
> > With your changes, we don't have this upside.
> 
> How do you think about to pick spelling corrections up for two comment lines?

Well, it wouldn't break anything, so that's positive. As I said in my last
email, these types of changes are perfect for new contributors to get started
with kernel development. I find less value in these patches if they're from
someone seemingly trying to rack up patch count.

Sean


> 
> Regards,
> Markus

-- 
Sean Paul, Software Engineer, Google / Chromium OS
