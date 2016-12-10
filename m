From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Dec 2016 22:10:58 +0000
Subject: Re: [media] bt8xx: One function call less in bttv_input_init() after error detection
Message-Id: <d3ab238e-02f0-2511-9be1-a1447e7639bc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
 <e20a6835-a404-e894-d0d0-a408bfcd7fb6@users.sourceforge.net>
 <ecf01283-e2eb-ecef-313f-123ba41c0336@grinta.net>
In-Reply-To: <ecf01283-e2eb-ecef-313f-123ba41c0336@grinta.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Nicolodi <daniele@grinta.net>
Cc: linux-media@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> kfree() is safe to call on a NULL pointer.

This is true.


> Despite that, you have found several instances of similar constructs:

Yes. - Special source code search pattern can point such places out
for further considerations.


> Didn't it occur to you that maybe those constructs are fine the way
> they are and this is the idiomatic way to write that kind of code?

Such a programming approach might look convenient. - I would prefer
a safer coding style for the corresponding exception handling.


> Why are you submitting patches implementing changes that have already
> been rejected?

The feedback to my update mixture is varying between acceptance and
disagreements as usual.


> Judging from your recent submissions, it seems that this process is not
> working well for you. I'm probably not the only one that is wonderign
> what are you trying to obtain with your patch submissions, other than
> having your name in the git log.

I am picking some change possibilities up in the hope of related
software improvements.

Regards,
Markus
