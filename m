From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 18 Jul 2020 08:41:47 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <alpine.DEB.2.22.394.2007181034530.2538@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1044091524-1595061708=:2538"
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
 <fa0ec546-9aee-5c95-428c-a225a3521f6f@web.de>
In-Reply-To: <fa0ec546-9aee-5c95-428c-a225a3521f6f@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1044091524-1595061708=:2538
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 18 Jul 2020, Markus Elfring wrote:

> >>> Applied.
> >>
> >> Do you care for patch review concerns according to this SmPL script adjustment?
> >>
> >> * https://lore.kernel.org/cocci/5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de/
> >>   https://lkml.org/lkml/2020/6/9/568
> >
> > This one it complete nonsense.
>
> I hope that different views can be clarified for such a software situation
> in more constructive ways.

You proposed essentially  \( A \| B \) \( | C \| \)

This is not valid syntax in the semantic patch language.  The branches of
a \( \| \) have to be a valid expression, statement, type, etc, not some
random string of tokens.

> >> * https://lore.kernel.org/cocci/c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de/
> >>   https://lkml.org/lkml/2020/6/8/637
> >
> > This on is indeed a problem.
>
> I find this feedback interesting.
>
> * How does it fit to your response “Applied”?
>
> * Will it trigger any more consequences?
>
>
> > Markus, if you would limit your comments to suggesting SmPL code
> > that is actually correct, ie that you have tested,
>
> Patch reviews contain usual risks that suggestions are presented
> which can be still questionable.

These are not "usual risks".  You can easily test out your suggestion by
yourself to see if it produces valid code.  If it doesn't, then don't make
the suggestion.

>
>
> > and 2) stop suggesting stupid things over and over
>
> We come along different development views.

Whenever you propose the same thing say 10 times or more and it is
rejected every time, I thikn you should be able to conclude that if you
propose the same thing again it will be rejected.

>
> > like that putting all of the virtual declarations on
> > the same line would save space (it does, but who cares),
>
> It seems that you admit a possibly desirable effect.

No, I don't consider the effect to be desirable.

> Will any more developers care also for SmPL coding style aspects?
>
>
> > then I would take your suggestions more seriously.
>
> Your change acceptance is varying to your development mood
> (and other factors), isn't it?

Not really.  My "change acceptance" increases when the person reporting
them raises real problems that is blocking them in some work.  And it
decreases rapidly when the changes are almost all related to presumed
"efficiencies" that have no impact in practice.

julia
--8323329-1044091524-1595061708=:2538--
