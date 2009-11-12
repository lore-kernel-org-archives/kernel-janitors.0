From: Casey Schaufler <casey@schaufler-ca.com>
Date: Thu, 12 Nov 2009 16:21:52 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <4AFC3620.2020809@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk> <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com> <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Serge E. Hallyn" <serue@us.ibm.com>, James Morris <jmorris@namei.org>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> On Thu, 12 Nov 2009, Serge E. Hallyn wrote:
>
>   
>> Quoting James Morris (jmorris@namei.org):
>>     
>>> On Thu, 12 Nov 2009, Julia Lawall wrote:
>>>
>>>       
>>>> From: Julia Lawall <julia@diku.dk>
>>>>
>>>> As observed by Joe Perches, sizeof of a constant string includes the
>>>> trailing 0.  If what is wanted is to check the initial characters of
>>>> another string, this trailing 0 should not be taken into account.  If an
>>>> exact match is wanted, strcmp should be used instead.
>>>>         
>>>> --- a/security/selinux/hooks.c
>>>> +++ b/security/selinux/hooks.c
>>>> @@ -448,7 +448,7 @@ static int sb_finish_set_opts(struct sup
>>>>  		sbsec->flags &= ~SE_SBLABELSUPP;
>>>>  
>>>>  	/* Special handling for sysfs. Is genfs but also has setxattr handler*/
>>>> -	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs")) = 0)
>>>> +	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs") - 1) = 0)
>>>>  		sbsec->flags |= SE_SBLABELSUPP;
>>>>         
>>> Shouldn't this be a simple strcmp() ?
>>>       
>> Yes I think so.
>>
>> Julia seems to be arguing that if a module introduces a new fs with
>> name 'sysfs_foo' then this check should match that fs too (since
>> for sysfs, sb->s_type->name = "sysfs" which also has a trailing \0,
>> so for the regular sysfs her patch makes no practical difference).
>>     
>
> If strcmp is what is wanted, I can make a patch for that.
>   

I strongly suggest that this is not what is wanted.
    strcmp(x,y)
and
    strncmp(x,y,sizeof(y))

are functionally equivalent and strcmp has a bad reputation in
the security community because it is associated with potential
buffer overrun issues.

    strncmp(x,y,sizeof(y)-1)

is not the same and is more cluttered as well. This code
does not need to be changed. It does what it is intended
to do in a strait-forward manner.
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-module" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>   

