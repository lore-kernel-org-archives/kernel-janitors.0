From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 18:10:27 +0000
Subject: Re: Further software improvements around Linux sequence API?
Message-Id: <47c7084e-21d8-4564-c237-84324dae17ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
 <20161024131311.ttwr2bblphg6vd2b@thunk.org>
 <e7ac4cba-bce1-edf5-a537-4c06a357bfb3@users.sourceforge.net>
 <20161024142037.rrslfxtimj44s5t6@thunk.org>
 <8592fa0c-e80a-77e2-fc44-4017f0988c8c@users.sourceforge.net>
 <20161024155112.ixdfi3ucs7sg2zgh@thunk.org>
In-Reply-To: <20161024155112.ixdfi3ucs7sg2zgh@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Theodore Ts'o <tytso@mit.edu>, linux-mips@linux-mips.org
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> An experienced developer would be able to very easily spot that trying
> to optimize seq_printf() versus seq_puts() is barely going to be measurab=
le.

Would you like to offer any incentives to use a more appropriate function
from this Linux programming interface for sequences?


> It's the sort of thing that a developer might fix while
> making other, more useful changes to a source file.

I get doubts when you expect that change possibilities with a higher
priority should and will almost always picked up before update candidates
with a lower impact.


> Well, please note that having a reputation of someone who insists on
> sending mostly junk patches (and like junk food, they may have some
> nutritive value; but that doesn't change the effect that the net
> benefit to person consuming them is marginal or negative), tends to
> give you a bad reputation, and may in fact be a hinderance towards
> your being able to attain "financial incentives".

I can not offer the =93shiny gold nugget=94 or =93pure diamond=94 so far di=
rectly
which is often preferred.


> If that is in fact your goal, I would gently suggest that you spend
> more time improving your skills, and learning more about higher-value
> ways you could contribute to the kernel, instead of spamming the
> kernel list with lots of low value patches.

* I could extend my source code search patterns in principle.
  How many developers and software reviewers struggle with results
  from existing code analysis tools?

* Will your interest occasionally grow for collateral software evolution?


> In the future if you are adding higher value improvements, and you want
> to do various cleanups, such as fixing up seq_printf -> seq_puts changes,=
 sure.

Is this kind of feedback a contradiction at the moment when you seem to give
the impression that my software development reputation is so damaged in the
=93junk food=94 sense that I could hardly achieve the software change mixtu=
re
which you would prefer?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
