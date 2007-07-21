From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Sat, 21 Jul 2007 16:17:08 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <Pine.LNX.4.64.0707211816030.21737@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com>
 <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org>
In-Reply-To: <20070720170743.GF14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Simon Arlott <simon@fire.lp0.eu>, Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On Jul 20 2007 11:07, Matthew Wilcox wrote:
>sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
>
>Any regexp ninjas want to have a go at something better?

You want \w+.

[ perl -i -pe 's/^\t* {6}(\w+:)/ $1/' "$@"
  Whether that is "better" depends on the user who uses it :) ]



	Jan
-- 
