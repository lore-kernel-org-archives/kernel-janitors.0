From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 13:54:51 +0000
Subject: Re: GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <77d74ffc-c833-f7ad-b1e2-5e07ac9d23a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
 <20170505140916.zoe4sxe3xjtvdlag@art_vandelay>
 <b859d1fb-bdf2-1738-8f28-28a31419b0d1@users.sourceforge.net>
 <20170506123304.2scgonpvt7kjf4cz@art_vandelay>
In-Reply-To: <20170506123304.2scgonpvt7kjf4cz@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sean Paul <seanpaul@chromium.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>

> Generally speaking, I don't care about checkpatch/cocci changes that aren't tested.

I find this view interesting only to some degree.

1. I suggest to combine a few functions into fewer ones.
   * Do you spot any programming mistakes in these concrete cases?
   * Can such code reduction result into desired effects?

2. I propose to use the function “seq_putc” at more source code places.
   * Do you really find any previous system test approaches insufficient around
     such a Linux feature?
   * Does the programming interface “seq_puts” provide any properties
     that you prefer over the other one for the sequence output of single characters?
     http://elixir.free-electrons.com/linux/v4.11/source/fs/seq_file.c#L664


> With your changes, we don't have this upside.

How do you think about to pick spelling corrections up for two comment lines?

Regards,
Markus
