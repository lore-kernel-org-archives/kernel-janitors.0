From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 01 Aug 2015 10:40:38 +0000
Subject: Re: [PATCH 03/11] ocfs2: Less checks in ocfs2_rename() after error detection
Message-Id: <55BCA226.2020401@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net>
 <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6>
 <55992DF0.5030205@users.sourceforge.net>
 <55993170.6060306@users.sourceforge.net> <20150706085414.GD28762@mwanda>
In-Reply-To: <20150706085414.GD28762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Sat, 4 Jul 2015 15:30:18 +0200
>>
>> Skip checks for a few variables in three error handling cases within
>> the ocfs2_rename() function by adjustment of a few jump targets
>> according to the Linux coding style convention.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> I don't think this is an improvement.

How do you think about the other update suggestions from this patch series?

Can the corresponding source code review be continued?

Regards,
Markus
