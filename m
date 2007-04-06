From: WANG Cong <xiyou.wangcong@gmail.com>
Date: Fri, 06 Apr 2007 14:17:36 +0000
Subject: Re: [KJ] how about a "NO-OP" macro or something?
Message-Id: <20070406141736.GA4115@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 06, 2007 at 10:02:36AM -0400, Robert P. J. Day wrote:
>On Fri, 6 Apr 2007, WANG Cong wrote:
>
>> On Fri, Apr 06, 2007 at 07:06:04AM -0400, Robert P. J. Day wrote:
>> >
>> >  it's amusing how many source/header files use the construct "do { }
>> >while (0)" to define macros into nothingness:
>> >
>> >  $ grep -r "do { } while (0)" * | wc -l
>> >  1051
>> >
>> >  i'm guessing it's *way* too late to do anything about it now, but
>> >wouldn't it have made more sense to define a "NO-OP" macro or
>> >something to represent the empty operation?  just thinking out loud.
>> >
>> >rday
>> >
>>
>> Oh, don't touch that. Let me tell you why 'do{...}while(0)' is a
>> good thing.
>
>i wasn't suggesting getting rid of the "do { } while (0)" construct.
>i was suggesting creating a macro to represent it, like:
>
>  #define NO_OP do { } while (0)
>
>and using "NO_OP" instead of spelling out the "do" construct in full.
>it's not only shorter, but it's clearer and, down the road, who knows
>if someone will want to redefine NO_OP to be something better?
>
>as i said, it's probably too late to do anything about the *current*
>usage, but perhaps future code can start taking advantage of this.
>
>rday
>

IMO, such replacement is useless. And I don't think NO_OP is better than 'do{ }while(0)'.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
