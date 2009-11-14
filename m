From: Casey Schaufler <casey@schaufler-ca.com>
Date: Sat, 14 Nov 2009 03:06:17 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <4AFE1EA9.60102@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk> <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com> <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk> <4AFC3620.2020809@schaufler-ca.com> <alpine.LRH.2.00.0911130833220.5497@tundra.namei.org>            <4AFCC06B.1030302@schaufler-ca.com> <19857.1258147396@turing-police.cc.vt.edu>
In-Reply-To: <19857.1258147396@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: James Morris <jmorris@namei.org>, Julia Lawall <julia@diku.dk>, "Serge E. Hallyn" <serue@us.ibm.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

Valdis.Kletnieks@vt.edu wrote:
> On Thu, 12 Nov 2009 18:11:55 PST, Casey Schaufler said:
>   
>> James Morris wrote:
>>     
>>> Do you see potential for a buffer overrun in this case?
>>>       
>
>   
>> No, but I hate arguing with people who think that every time
>> they see strcmp that they have found a security flaw.
>>     
>
> How do you feel about people who think every time they see strcmp()
> "Oh crap, something that needs auditing"? ;)
>   

They have my deep sympathy. Which is why I'm advocating leaving
the perfectly functional and correct use of strncmp() as it is.

> The biggest problem with strcmp() is that even if it got audited when that code
> went in, it's prone to unaudited breakage when somebody changes something in
> some other piece of code, quite often in some other .c file in some other
> directory.
>
> Julia, is there a way to use coccinelle to detect unsafe changes like that?  Or
> is expressing those semantics too difficult?
>
>
>   

