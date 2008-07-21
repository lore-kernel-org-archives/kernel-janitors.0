From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 21 Jul 2008 11:23:55 +0000
Subject: Re: [PATCH] x86-kernel: fix sparse warnings
Message-Id: <20080721112355.GA23095@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215879607.19076.36.camel@jaswinder.satnam>
In-Reply-To: <1215879607.19076.36.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Jaswinder Singh <jaswinder@infradead.org> wrote:

> =EF=BB=BFI am trying to solve following sparse warnings. Please give me f=
eedback
> for the Patch. You can also find updated sparse patches from
> http://git.infradead.org/users/jaswinder/sparse-2.6.git

>  28 files changed, 140 insertions(+), 18 deletions(-)

nice.

Could you please split this up into individual commits, and against=20
tip/master:

  http://people.redhat.com/mingo/tip.git/README

Granularity should be roughly per file. (i.e. around 30 commits would be=20
fine) That way if any commit is found to be bad we can unapply/revert it=20
just fine without the rest of your changes. Merging into different topic=20
branches is also easier that way.

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
