From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 20:28:43 +0000
Subject: Re: [PATCH] Staging: rtl8192su: ieee80211: fix brace coding style
Message-Id: <20100526202842.GO22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1274891337-7783-1-git-send-email-madness@xakep.ru> <20100526184808.GA6031@coldcone>
In-Reply-To: <20100526184808.GA6031@coldcone>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: Bashlykov Arthur <madness@xakep.ru>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 26, 2010 at 10:48:08PM +0400, Denis Kirjanov wrote:
> On Wed, May 26, 2010 at 20:28 +0400, Bashlykov Arthur wrote:

> > -	if (!ieee->proto_started){
> > +	if (!ieee->proto_started) {
> >  		ieee->iw_mode = wrqu->mode;
> 
> I guess we can drop braces with single else statement

How Bashlykov has this is proper kernel style because the else statement
has more than one line.

> > -	}else{
> > +	} else {
> >  		ieee80211_stop_protocol(ieee);
> >  		ieee->iw_mode = wrqu->mode;
> >  		ieee80211_start_protocol(ieee);

The rest of your comments were correct of course.  Thanks for reviewing
this patch.

regards,
dan carpenter
