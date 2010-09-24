From: T Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 21:12:37 +0000
Subject: Re: [PATCH 00/21] Staging: cleaned up makefiles cflag lines
Message-Id: <AANLkTimoQr4W8XQ0ATCP2BY7cJnvLfTafuqPDheqZA5w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikqf4rn6BP2gyQAuQrvt7EdFY8yfa+o8nfR9xWE@mail.gmail.com>
	<AANLkTikvGGz+33ni=Kov1qM1DpSj2WVuk89u=TwE9iL_@mail.gmail.com>
	<AANLkTin1YfwwVcDNUBsi34iYC6HA5Y6+uOFZN=+Q2hqs@mail.gmail.com>
	<20100924205108.GA8191@haskell.muteddisk.com>
In-Reply-To: <20100924205108.GA8191@haskell.muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: T Dent <tdent48227@gmail.com>, matt mooney <mfmooney@gmail.com>, greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/24/10, matt mooney <mfm@muteddisk.com> wrote:
> On 16:39 Fri 24 Sep     , T Dent wrote:
>> On 9/24/10, matt mooney <mfmooney@gmail.com> wrote:
>> > On Fri, Sep 24, 2010 at 11:25 AM, T Dent <tdent48227@gmail.com> wrote:
>> >> I changed every makefile in the staging directory to use the proper
>> >> ccflags-y option instead of EXTRA_CFLAGS. It builds also :) .
>> >
>> > Um, you didn't do a lot of these right. Maybe you should look into why
>> > the change was made in the first place. For semantic reasons, I was
>> > also changing the first assignment to ":=" from "+=".
>>
>> I can resend them with the a small modification to the patch files if you
>> want.
>
> After looking at more of them, my "a lot" was a little bit of an
> overstatement. The first few I randomly looked at happen to use the
> incorrect
> pattern, but most are simple without relying on a variable. Yeah, I think
> you
> should resubmit with a "[PATCH v2]." The pattern is:
>
> ifeq ($(FOO),y)
>      EXTRA_CFLAGS := <flags>
> endif
>
> changes to:
>
> ccflags-$(FOO) := <flags>
>
> Also, the rest of the kernel tree has been done except drivers/media;
> however, I
> am going to email them in a little bit asking if some consolidation is
> possible
> due to every driver there relying on a few flags. So thanks for the help
> (though
> is was a good thing I was saving staging for last)!
>
> -mfm
>
>

Okay i'll resubmit the patches when I edit it how you said.

Thanks,
Tracey
