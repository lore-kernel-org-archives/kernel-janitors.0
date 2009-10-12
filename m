From: Jiri Slaby <jirislaby@gmail.com>
Date: Mon, 12 Oct 2009 10:11:20 +0000
Subject: Stanse 1.0.0 released [was: wireless: wl12xx, fix lock imbalance]
Message-Id: <4AD300C8.3090502@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1247520266-32007-1-git-send-email-jirislaby@gmail.com> <1247521235.7178.1.camel@johannes.local> <4A5BAABF.9020708@gmail.com> <1247521789.7178.2.camel@johannes.local> <4A5BAC77.9010503@gmail.com> <1247522068.7178.4.camel@johannes.local> <20090718111948.GD27287@elte.hu> <1247916829.1055.24.camel@johannes.local> <20090718161029.GA16343@elte.hu>
In-Reply-To: <20090718161029.GA16343@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Johannes Berg <johannes@sipsolutions.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/18/2009 06:10 PM, Ingo Molnar wrote:
>>> Plus static tools like Jiri is working on are very useful as 
>>> well. I think Coverty does that too and it's a pity we dont have 
>>> free tools for that. In fact Covery will sweep clean the kernel 
>>> of such bugs, giving OSS tools like 'stanse' the false 
>>> impression that there are no such bugs. There are such bugs - 
>>> there's a constant influx of them. So please work on this, it 
>>> looks very useful.
>>
>> What's "this" in this context?
> 
> this = stanse, the static code analyzing thing Jiri mentioned he is 
> working on. The webpage says it will be under the GPL - that's good. 
> Jiri, any release date for the source code?

Hi all. I'm pleased to announce the first official Stanse release.

For those who are interested, the tool (with other information and
documentation) is available at
http://stanse.fi.muni.cz/

There are also prebuilt rpm packages for openSUSE and Fedora 11. (Some
of them still building, will be available soon. Sorry for that, build
service is slow as hell these days.)

Also I pre-ran the stanse on 2.6.32-rc3 with results available online.
The webpage concerning this is at:
http://decibel.fi.muni.cz/~xslaby/stanse/?db2-rc

So for those who are not interested in the toolkit itself but only in
results from more-or-less latest kernel may try it that way.

There are many janitor-like bugs. E.g. not testing return values from
k*alloc might be seamlessly taken care of by janitors, I think.

As it's only static analysis not based on symbolic execution (we will
play with that later), there are some/many (depending on a checker) many
false positives. There is a mechanism for marking them. I ask everybody
who finds a FP or error to mark the entry as such.

I'm still trying to lower FP rate. If somebody finds out another method
to do so, please share with us.

Any input appreciated. Hope it helps.

Thanks to those who support us,
--js
