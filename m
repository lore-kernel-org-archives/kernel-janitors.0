From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 26 Jul 2013 16:23:02 +0000
Subject: Re: Need clearance before sending patch
Message-Id: <51F29F96.9030309@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1307261746260.2266@hadrien>
In-Reply-To: <alpine.DEB.2.02.1307261746260.2266@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 26 July 2013 09:21 PM, Julia Lawall wrote:
> On Fri, 26 Jul 2013, Kumar Gaurav wrote:
>
>> Hi Dan,
>>
>> I had sent my first patch with lots of changes which wasn't correct.
>> Now i'm splitting them in parts as below:
>> 1.One patch for variable name replacement (one patch per file)
>> 2.One Patch for fixing coding style issue (one patch per file)
>> 3.One Patch for fixing warning about using pr_warn,pr_error functions
>> instead of printk(KERN_WARNING... and printk(KERN_ERR... (havn't
>> replaced yet as last time you weren't convinced)
>>
>> please tell me that should i apply these patches per file or one patch
>> for replacement in all applied files?
>
> I wonder if one would be better off by starting with small isolated
> bugs, rather than these things that, even though they seem simple, are a
> bit pervasive and rely a lot on taste?
>
> Finding real bugs is not so hard.  One can either use the various tools
> that are provided, or study the git logs to see what kind of bugs others
> have found.
>
> julia
Thanks for your reply Julia. I'll start looking for real bug right ahead 
but want to fix with what i started so just waiting for answer or above 
questions.
In mean while i'm looking at bugs and will try to fix them if i find any.

Thanks

Kumar gaurav
