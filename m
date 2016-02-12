From: Kevin Wern <kevin.m.wern@gmail.com>
Date: Fri, 12 Feb 2016 05:35:19 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <CANtyZjQg4NL1N_ZrJep522C1YHfGWHNznwSn4MKaeTKiTA-sfw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Not really.
>
> That'd only find an additional
>         sscanf
>                 (buf,
>                  foo,
>                  bar);
>
> And that's quite unlikely.
>

I fail to see the issue if it matches everything matched by /\bsscanf\b\s*(/,
plus one additional case that is unlikey, but still valid.

I can do a patch the $line match you described, but I'd prefer to do what I
previously described.

Thanks again for your feedback.

Kevin
