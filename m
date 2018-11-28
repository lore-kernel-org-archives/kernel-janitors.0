From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 28 Nov 2018 16:16:19 +0000
Subject: Re: [PATCH] staging: speakup: i18n: fix spelling mistake "phoneticly" -> "phonetically"
Message-Id: <20181128161619.eee5hucep7mw47fi@function>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181128161232.14907-1-colin.king@canonical.com>
In-Reply-To: <20181128161232.14907-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

Colin King, le mer. 28 nov. 2018 16:12:32 +0000, a ecrit:
> -	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phoneticly",
> +	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phonetically",

Mmm, clearly an english typo. Speakup people, do you think there might
be any downside here?  Could it be that it was done on purpose for e.g.
syntheses to pronounce it right?

Samuel
