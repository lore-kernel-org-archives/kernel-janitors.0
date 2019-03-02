From: Christopher Brannon <chris@the-brannons.com>
Date: Sat, 02 Mar 2019 21:27:12 +0000
Subject: Re: [PATCH] staging: speakup: i18n: fix spelling mistake "phoneticly" -> "phonetically"
Message-Id: <20190302212712.E32277B0CF@hurricane.the-brannons.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181128161232.14907-1-colin.king@canonical.com> <20190302194211.4aj6r3dr4hahbnqi@function>
In-Reply-To: <20190302194211.4aj6r3dr4hahbnqi@function>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Colin King <colin.king@canonical.com>, William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Samuel Thibault writes:
> Hello,
>
> Colin King, le mer. 28 nov. 2018 16:12:32 +0000, a ecrit:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in array speakup_default_msgs at index
> > MSG_FUNCNAME_SPELL_WORD_PHONETICALLY, fix this.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> We never got any feedback from the speakup mailing list, I guess fixing
> the typo is fine.

I'm sure there were deliberate mis-spellings in Speakup error
messages to accomodate pronunciation issues with older synths, but I
have no idea whether this is one of them.  It's probably fine either way.

-- Chris
