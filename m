From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Apr 2020 14:54:13 +0000
Subject: Re: [v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <166ad4b2-5c27-9027-6eef-83d0faef4d1b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428020223.GA28074@udknight>
 <35069ae9-cdb4-4728-5e94-6d863dd2721c@web.de>
 <20200428140649.GA30042@udknight>
In-Reply-To: <20200428140649.GA30042@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> I guess it is a better perl programming practice that use non-capturing group always

I suggest to reconsider the information “always”.


> when you don't need to use the '$' to access it,

Such an expectation can be fine if alternatives would be specified in
the notation “(?:…)”.


> it will make code a little faster I guess.

I hope this also when such a specification is actually needed.


>> * Would we like to support any other quotation characters around
>>   the commit summary?
>
> I think we don't need now

I propose to reconsider also this view.
How should titles be safely handled if they contain the mentioned
quotation characters?

Can it be that you are used to the application of a specific language
where you should choose between two quotes for specification
of attributes (or text)?


> and people could patch it easily when we need others in future:)

I guess that there are further software development challenges to consider.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/checkpatch.pl?id=b240f960afb900e59112ebcfa5a759bb0a85a14e#n2872

Regards,
Markus
