From: Daniele Nicolodi <daniele@grinta.net>
Date: Sun, 11 Dec 2016 21:52:41 +0000
Subject: Re: [media] bt8xx: One function call less in bttv_input_init() after error detection
Message-Id: <5560ffc2-e17d-5750-24e5-3150aba5d8aa@grinta.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
 <e20a6835-a404-e894-d0d0-a408bfcd7fb6@users.sourceforge.net>
 <ecf01283-e2eb-ecef-313f-123ba41c0336@grinta.net>
 <d3ab238e-02f0-2511-9be1-a1447e7639bc@users.sourceforge.net>
In-Reply-To: <d3ab238e-02f0-2511-9be1-a1447e7639bc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 10/12/16 15:10, SF Markus Elfring wrote:
>> Despite that, you have found several instances of similar constructs:
> 
> Yes. - Special source code search pattern can point such places out
> for further considerations.

This is one of the things that makes reviewing the patches you submit
quire annoying: if a class of changes has already been turned town, why
do you insist in proposing it?

>> Didn't it occur to you that maybe those constructs are fine the way
>> they are and this is the idiomatic way to write that kind of code?
> 
> Such a programming approach might look convenient. - I would prefer
> a safer coding style for the corresponding exception handling.

Can you please point out what is wrong in the current code and how the
changes you propose fix the problem?  Clearly the people reading your
patches do not see the problem you are seeing.

>> Why are you submitting patches implementing changes that have already
>> been rejected?
> 
> The feedback to my update mixture is varying between acceptance and
> disagreements as usual.

No one has expressed acceptance for the kind of change you propose with
this patch, or to previous patches you proposed changing similar constructs.

>> Judging from your recent submissions, it seems that this process is not
>> working well for you. I'm probably not the only one that is wonderign
>> what are you trying to obtain with your patch submissions, other than
>> having your name in the git log.
> 
> I am picking some change possibilities up in the hope of related
> software improvements.

The fact that you propose over and over again a class of changes that
has been already vocally rejected would suggest otherwise. The major
achievement you obtained so far is that one of the maintainers of a
large fraction of the kernel refuses to look at your patch submissions.

Maybe you should revise how you contribute to Linux kernel development.
Apparently ignoring comments to your previous patch submission and not
showing that you have been learning from previous interactions, is not
going to help.

Cheers,
Daniele

