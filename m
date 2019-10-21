From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 21 Oct 2019 15:25:41 +0000
Subject: Re: [PATCH] apparmor: Fix use-after-free in aa_audit_rule_init
Message-Id: <CAEkB2EQgv9_niKU0dagjZH-wRoHc=6+X4O7nGoVbaz9LWPwy6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017014619.26708-1-navid.emamdoost@gmail.com>
 <83dcacc2-a820-fe63-a1b9-1809e8f14f2f@web.de> <57b61298-cbeb-f0ff-c6ba-b8f64d5d0287@canonical.com>
In-Reply-To: <57b61298-cbeb-f0ff-c6ba-b8f64d5d0287@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: John Johansen <john.johansen@canonical.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Tyler Hicks <tyhicks@canonical.com>

On Sun, Oct 20, 2019 at 1:51 PM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 10/20/19 7:16 AM, Markus Elfring wrote:
> >> … But after this release the the return statement
> >> tries to access the label field of the rule which results in
> >> use-after-free. Before releaseing the rule, copy errNo and return it
> >> after releasing rule.
> >
> Navid thanks for finding this, and Markus thanks for the review
>
> > Please avoid a duplicate word and a typo in this change description.
> > My preference would be a v2 version of the patch with the small clean-ups
> that Markus has pointed out.

John and Markus, I updated and submitted v2.

>
> If I don't see a v2 this week I can pull this one in and do the revisions
> myself adding a little fix-up note.
>
> >
> > …
> >> +++ b/security/apparmor/audit.c
> > …
> >> @@ -197,8 +198,9 @@ int aa_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule)
> >>      rule->label = aa_label_parse(&root_ns->unconfined->label, rulestr,
> >>                                   GFP_KERNEL, true, false);
> >>      if (IS_ERR(rule->label)) {
> >> +            err = rule->label;
> >
> > How do you think about to define the added local variable in this if branch directly?
> >
> > +             int err = rule->label;
> >
>
> yes, since err isn't defined or in use else where this would be preferable
>
> >>              aa_audit_rule_free(rule);
> >> -            return PTR_ERR(rule->label);
> >> +            return PTR_ERR(err);
> >>      }
> >>
> >>      *vrule = rule;
> >
> >
> > Regards,
> > Markus
> >
>


-- 
Thanks,
Navid.
