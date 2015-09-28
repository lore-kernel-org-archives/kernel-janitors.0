From: Andrzej Hajda <a.hajda@samsung.com>
Date: Mon, 28 Sep 2015 12:12:08 +0000
Subject: Re: [PATCH v2] coccinelle: assign signed result to unsigned variable
Message-Id: <56092E98.9000103@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
 <56092D7B.4030106@users.sourceforge.net>
In-Reply-To: <56092D7B.4030106@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 09/28/2015 02:07 PM, SF Markus Elfring wrote:
>> +// Options: --include-headers --all-includes
> 
> How do you think about the reuse of the parameter "--recursive-includes" here?

Last time I have tried it, kernel source check took more than 10 hours, so I
gave up.

Regards
Andrzej

> 
> Will the list of checked function calls become more complete then?
> 
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

