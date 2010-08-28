From: David Brownell <david-b@pacbell.net>
Date: Sat, 28 Aug 2010 18:19:39 +0000
Subject: Re: [PATCH 2/7] drivers/usb/gadget: Remove double test
Message-Id: <611014.87741.qm@web180303.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4C79435B.2030303@s5r6.in-berlin.de>
References: <1283010066-20935-3-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Thomas Dahlmann <dahlmann.thomas@arcor.de>, kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org



--- On Sat, 8/28/10, Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:

> There is only a drawback if the subject
> is too broad /and/ > if the Cc list is
> too short;=A0

Not entirely true.  Recall that one of the roles
of the patch summary is serving as a search key
for Google or whatever ... changing it decouples patches from their discuss=
ion,  complicating
later troubleshooting (probably not in this
case, but for some patches, very much so).

- Dave


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
