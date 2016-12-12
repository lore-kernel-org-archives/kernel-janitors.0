From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Dec 2016 17:15:45 +0000
Subject: Re: [media] bt8xx: One function call less in bttv_input_init() after error detection
Message-Id: <baf6a24e-6a4e-f1ea-1b4d-7a3211964e4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
 <e20a6835-a404-e894-d0d0-a408bfcd7fb6@users.sourceforge.net>
 <ecf01283-e2eb-ecef-313f-123ba41c0336@grinta.net>
 <d3ab238e-02f0-2511-9be1-a1447e7639bc@users.sourceforge.net>
 <5560ffc2-e17d-5750-24e5-3150aba5d8aa@grinta.net>
 <ce612b15-0dff-ce33-6b22-3a2775bed4cd@users.sourceforge.net>
 <581046dd-0a4a-acea-a6a8-8d2469594881@grinta.net>
In-Reply-To: <581046dd-0a4a-acea-a6a8-8d2469594881@grinta.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Nicolodi <daniele@grinta.net>
Cc: linux-media@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I suggest to check return values immediately after each function call.
>> An error situation can be detected earlier then and only the required
>> clean-up functionality will be executed at the end.
> 
> Which improvement does this bring?

* How do you think about to avoid requesting additional system resources
  when it was determined that a previously required memory allocation failed?

* Can the corresponding exception handling become a bit more efficient?


> Why?

Do you care for any results from static source code analysis?

Regards,
Markus
