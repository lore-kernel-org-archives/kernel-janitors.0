From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 15:18:52 +0000
Subject: Re: [v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <f1234e16-eca2-e2af-c5a6-92f47fcbd98d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428020223.GA28074@udknight>
 <38e1a926-53a6-bda6-cb07-2614f4c682ba@web.de>
 <20200428161831.GB30042@udknight>
In-Reply-To: <20200428161831.GB30042@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Matteo Croce <mcroce@redhat.com>

>> * Do you try to extend the existing software analysis approach “GIT_COMMIT_ID”?
>>
>> * Would you like to avoid the development of duplicate Perl code?
>
> Fixes: lines don't need to have a "commit" prefix before the commit id, the description
> in normal commit id could across multiple lines, and we don't need to consider the
> $commit_log_possible_stack_dump for 'Fixes:' tag line.

It can be helpful to know such differences.


> I mean it will make the GIT_COMMIT_ID code become harder to read and maintain.

This view depends on some factors.

* How many data processing can be shared for your software extension?

* Do you get any further development ideas from a previous suggestion
  by Joe Perches according to the discussion topic “linux-next:
  Fixes tag needs some work in the tip tree”?
  https://lkml.org/lkml/2019/1/17/966
  https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel@perches.com/

Regards,
Markus
