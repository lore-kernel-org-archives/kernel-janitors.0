From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 17 Sep 2015 08:46:16 +0000
Subject: Re: [PATCH 1/2] ASoC: qcom: change PTR_ERR argument
Message-Id: <alpine.DEB.2.10.1509171045100.2399@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
 <20150914180425.GB12027@sirena.org.uk>
In-Reply-To: <20150914180425.GB12027@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>



On Mon, 14 Sep 2015, Mark Brown wrote:

> On Sun, Aug 30, 2015 at 08:05:10PM +0200, Julia Lawall wrote:
> > Apply PTR_ERR to the value that was recently assigned.
> >
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
>
> I have no idea what's going on with this stuff without spending more
> time than it looks like should need, there's a moderately big thread and
> some patches posted in the middle of it.  Can you repost whatever the
> current state is please?

The discussion was about introducing a temporary variable to simplify the
code.  But that makes a lot of changes, so I think it would be better to
just apply the original bug fixing patch as is, and then the cleanup could
be applied on top of that.  I will submit the original patch again.

julia
