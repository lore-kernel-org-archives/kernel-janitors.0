From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 09 Apr 2009 12:51:23 +0000
Subject: Re: [PATCH 13/56] i2c: Remove void casts
Message-Id: <20090409135123.36e6415b@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
	<20090409144334.4c283ef2@hyperion.delvare>
In-Reply-To: <20090409144334.4c283ef2@hyperion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Jack Stone <jwjstone@fastmail.fm>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Thu, 9 Apr 2009 14:43:34 +0200
Jean Delvare <khali@linux-fr.org> wrote:

> Hi Jack,
> 
> On Wed,  8 Apr 2009 12:21:45 +0100, Jack Stone wrote:
> > Remove uneeded void casts
> > 
> > Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> 
> WARNING: Signed-off-by: is the preferred form

Nothing actually cares, and if anyone does then we have software for the
mindless purpose of changing the case of words

Alan
