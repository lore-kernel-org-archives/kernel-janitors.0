From: Casey Schaufler <casey@schaufler-ca.com>
Date: Fri, 13 Nov 2009 02:11:55 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <4AFCC06B.1030302@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk> <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com> <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk> <4AFC3620.2020809@schaufler-ca.com> <alpine.LRH.2.00.0911130833220.5497@tundra.namei.org>
In-Reply-To: <alpine.LRH.2.00.0911130833220.5497@tundra.namei.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>
Cc: Julia Lawall <julia@diku.dk>, "Serge E. Hallyn" <serue@us.ibm.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

James Morris wrote:
> On Thu, 12 Nov 2009, Casey Schaufler wrote:
>
>   
>> I strongly suggest that this is not what is wanted.
>>     strcmp(x,y)
>> and
>>     strncmp(x,y,sizeof(y))
>>
>> are functionally equivalent and strcmp has a bad reputation in
>> the security community because it is associated with potential
>> buffer overrun issues.
>>     
>
> Do you see potential for a buffer overrun in this case?
>   

No, but I hate arguing with people who think that every time
they see strcmp that they have found a security flaw. The
existing code does exactly what it is intended to. Why make
a change that just clutters things up?

> The strings being compared are "sysfs" and the name field of 'struct 
> file_system_type'.  The kernel code elsewhere assumes the latter string to 
> be a valid zero-terminated string, and we should, too.
>
>
> - James
>   

