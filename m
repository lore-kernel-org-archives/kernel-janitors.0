From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Tue, 19 Dec 2006 09:58:42 +0000
Subject: Re: [KJ] Any comments to this patch?
Message-Id: <4984.41.242.43.239.1166522322.squirrel@mail.kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612190135o3b94b1a0rec261c908711423@mail.gmail.com>
In-Reply-To: <80ec54e90612190135o3b94b1a0rec261c908711423@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> --- linux-2.6.19.1/kernel/auditfilter.c	2006-12-11 20:32:53.000000000
> +0100
> +++ newlinux/kernel/auditfilter.c	2006-12-15 15:52:30.000000000 +0100
> @@ -636,10 +636,9 @@ static struct audit_rule *audit_krule_to
>  	struct audit_rule *rule;
>  	int i;
>
> -	rule = kmalloc(sizeof(*rule), GFP_KERNEL);
> +	rule = kzalloc(sizeof(*rule), GFP_KERNEL);
>  	if (unlikely(!rule))
>  		return NULL;
> -	memset(rule, 0, sizeof(*rule));
>
>  	rule->flags = krule->flags | krule->listnr;
>  	rule->action = krule->action;

Looks good.

> @@ -655,7 +654,7 @@ static struct audit_rule *audit_krule_to
>  			rule->fields[i] |= krule->fields[i].op;
>  		}
>  	}
> -	for (i = 0; i < AUDIT_BITMASK_SIZE; i++) rule->mask[i] = krule->mask[i];
> +	memcpy(rule->mask, krule->mask, sizeof(rule->mask));
>
>  	return rule;
>  }

May be less clear (arguable) but probably more efficient.

> @@ -667,10 +666,9 @@ static struct audit_rule_data *audit_kru
>  	void *bufp;
>  	int i;
>
> -	data = kmalloc(sizeof(*data) + krule->buflen, GFP_KERNEL);
> +	data = kzalloc(sizeof(*data) + krule->buflen, GFP_KERNEL);
>  	if (unlikely(!data))
>  		return NULL;
> -	memset(data, 0, sizeof(*data));
>
>  	data->flags = krule->flags | krule->listnr;
>  	data->action = krule->action;
> @@ -707,7 +705,7 @@ static struct audit_rule_data *audit_kru
>  			data->values[i] = f->val;
>  		}
>  	}
> -	for (i = 0; i < AUDIT_BITMASK_SIZE; i++) data->mask[i] = krule->mask[i];
> +	memcpy(data->mask, krule->mask, sizeof(data->mask));
>
>  	return data;
>  }
> @@ -758,11 +756,7 @@ static int audit_compare_rule(struct aud
>  		}
>  	}
>
> -	for (i = 0; i < AUDIT_BITMASK_SIZE; i++)
> -		if (a->mask[i] != b->mask[i])
> -			return 1;
> -
> -	return 0;
> +	return memcmp(a->mask, b->mask, sizeof(a->mask)) ? 1 : 0;
>  }
>

What about memcmp(...) != 0 or !!memcmp(...)  ?

My 2c,

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
