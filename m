From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 10:42:12 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <b4f1f555-4e54-8258-cd0c-764c6b314fee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019092943.hbghcaifwkcdsgd3@redbean>
In-Reply-To: <20171019092943.hbghcaifwkcdsgd3@redbean>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jessica Yu <jeyu@kernel.org>, kernel-janitors@vger.kernel.org
Cc: Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

>> @@ -837,10 +837,8 @@ static int add_module_usage(struct module *a, struct module *b)
>>
>>     pr_debug("Allocating new usage for %s.\n", a->name);
>>     use = kmalloc(sizeof(*use), GFP_ATOMIC);
>> -    if (!use) {
>> -        pr_warn("%s: out of memory loading\n", a->name);
>> +    if (!use)
>>         return -ENOMEM;
>> -    }
> 
> IMO this is removing useful information.

How do you think about to clarify the circumstances any further?


> Although stack traces are generated on alloc failures,

Do you ever want to switch them off for special use cases?


> the extra print also tells us which module we were trying to load
> at the time the memory allocation failed.

Can a default allocation failure report provide the same information already?

Regards,
Markus
