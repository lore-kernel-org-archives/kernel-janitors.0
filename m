From: Oleg Verych <olecom@flower.upol.cz>
Date: Fri, 20 Jul 2007 20:50:42 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <E1IBzQw-0000Im-55@flower>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org>
In-Reply-To: <20070720170743.GF14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Simon Arlott <simon@fire.lp0.eu>, Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

* Date: Fri, 20 Jul 2007 11:07:43 -0600

> Of course, we can't add this flag to Lindent until it's widely
> circulating amongst the distributions.  Perhaps we can add this to
> Lindent in the meantime:
>
> sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
>
> which will replace the leading tabs and spaces with one space.
> It should leave case labels unmolested, as they should be indented with
> tabs, not 6 spaces.
>
> Any regexp ninjas want to have a go at something better?

I'm the one. Trying to write portable, optimized and easy to
understand scripts [0].

Please, describe more what must be done, and i will do it. Case labels
are handled very strangely in you example.

[0] <E1HwY9K-0008Jz-CG@flower>
____
