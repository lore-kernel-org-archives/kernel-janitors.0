From: Bernd Petrovitsch <bernd@firmix.at>
Date: Wed, 18 Nov 2009 12:01:51 +0000
Subject: Re: [PATCH 1/1] Removed Dead Code
Message-Id: <1258545712.16246.53.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091117053847.GA19184@MSServer>
In-Reply-To: <20091117053847.GA19184@MSServer>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2009-11-17 at 19:12 -0500, Michael Spradling wrote:
> Does anyone have any comments, how do I know if this patch is ever taken in...
Yes (but perhaps not the one you expected;-).
A review takes usually more than a day (since people tend to have other,
higher priorities too). And BTW it doesn't speed up if you send the same
3 times without good reason (and if there is a good reason, there is no
need to hide it). And the subject as above is *much* better (as it
describes the intentions of the patch and not your personal ones) than
the one on the 1st mail.

A good way to speed up the review process is to send the mail also
directly to the relevant maintainers and interested people (and probably
the big kernel-mailinglist. No need to subscribe it - it is expected
that people use Reply-to-all and not delete any Cc:s - unless you really
know what you do[0]). The simplest way is to use
scripts/get_maintainer.pl to get a list of probably interested and
*relevant* (read: subsystem maintainer) people/mailing-lists.

Even if 5 people review and ack-it hereover, it is no help as long as
the maintainer(s) ignore it (or NACK it for whatever reason).

As for the patch as such: Not that I looked into the framebuffer
driver(s) or anywhere else, but it's probably good to also mention why
you believe that that functions are dead code.
There basically two possibilities: Was in for ages and isn't used any
longer or is needed for new features. And the subsystem maintainer
should know (and I don't know - so I can't comment on it) .....

> Is there a server somewhere that shows integration status
Not until you run one;-)
You usually should get some feedback who is taking it and - depending on
subsystem, it's maintainer, the length of the chain towards Linux,
release dates, etc. - it eventually shows up in mainline and you may get
some status mails before (e.g. AKPM has scripts which also report
towards submitters - and reviewers IIRC).

	Bernd

[0]: *If* you really know what you do, you will know it on your own.
     Before, just stick to the rule;-)
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


