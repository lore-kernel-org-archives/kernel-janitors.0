From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 20 Oct 2019 14:16:19 +0000
Subject: Re: [PATCH] apparmor: Fix use-after-free in aa_audit_rule_init
Message-Id: <83dcacc2-a820-fe63-a1b9-1809e8f14f2f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017014619.26708-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191017014619.26708-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, James Morris <jmorris@namei.org>, John Johansen <john.johansen@canonical.com>, "Serge E. Hallyn" <serge@hallyn.com>, Tyler Hicks <tyhicks@canonical.com>

> … But after this release the the return statement
> tries to access the label field of the rule which results in
> use-after-free. Before releaseing the rule, copy errNo and return it
> after releasing rule.

Please avoid a duplicate word and a typo in this change description.


…
> +++ b/security/apparmor/audit.c
…
> @@ -197,8 +198,9 @@ int aa_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule)
>  	rule->label = aa_label_parse(&root_ns->unconfined->label, rulestr,
>  				     GFP_KERNEL, true, false);
>  	if (IS_ERR(rule->label)) {
> +		err = rule->label;

How do you think about to define the added local variable in this if branch directly?

+		int err = rule->label;

>  		aa_audit_rule_free(rule);
> -		return PTR_ERR(rule->label);
> +		return PTR_ERR(err);
>  	}
>
>  	*vrule = rule;


Regards,
Markus
