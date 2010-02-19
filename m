From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Feb 2010 16:58:51 +0000
Subject: Re: [patch] oxygen: clean up. make precedence explicit
Message-Id: <20100219165850.GD17130@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B7E4BD1.3040106@ladisch.de> <20100219101047.GB17130@bicker>
	<1266575610.31443.6.camel@thorin> <20100219112921.GC17130@bicker>
In-Reply-To: <20100219112921.GC17130@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>

On Fri, Feb 19, 2010 at 02:29:21PM +0300, Dan Carpenter wrote:
> On Fri, Feb 19, 2010 at 11:33:30AM +0100, Bernd Petrovitsch wrote:
> > On Fre, 2010-02-19 at 13:10 +0300, Dan Carpenter wrote:
> > > On Fri, Feb 19, 2010 at 09:29:05AM +0100, Clemens Ladisch wrote:
> > > > > This doesn't change anything, but I think it makes the code clearer.
> > > > > It silences a smatch warning:
> > > > > sound/pci/oxygen/oxygen_mixer.c +91 dac_mute_put(7) warn: add some parenthesis here?
> > > > 
> > > > That message doesn't say why some parentheses should be added.
> > > > And it's a question; how do I give it the answer "no"?  :-)
> > > > 
> > > > > -	changed = !value->value.integer.value[0] != chip->dac_mute;
> > > > > +	changed = (!value->value.integer.value[0]) != chip->dac_mute;
> > > > 
> > > > This doesn't look any clearer to me; I don't think that the unary
> > > > negation operator could be thought to have lower precedence than "!=".
> > > 
> > > Well, it's hard to argue that it's more ambiguous.  :P
> > But it doesn't make the code clearer - unless you are a C novice. Unary
> > operators generally bind stronger than others - be it "+", "-", "!",
> > "~", "*".
> > I would expect kernel programmers to know that (and I don't assume
> > in-depth knowledge of operator precedence rules).
> > 
> > > > Why does smatch warn about this combination?  Do such errors actually
> > > > happen:
> > > 
> > > Yep.  I have made some myself when writing smatch.
> > > 
> > > For example here are some related bugs in the current kernel.
> > > 
> > > drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > >    721          if (!ext->ext_flags & IW_ENCODE_EXT_GROUP_KEY &&
> > Well, I see potential bugs here and the if() should have been
> > a) if (!(ext->ext_flags & IW_ENCODE_EXT_GROUP_KEY) &&
> 
> Yep.  This is clearly what the code should say.
> 
> The problem in the original code is that IW_ENCODE_EXT_GROUP_KEY is not 
> equal to either 1 or to 0.  (So that means the condition in the original 
> code is always false).
> 

Except the last _bit_ of IW_ENCODE_EXT_GROUP_KEY _is_ equal to one or zero
and I am an idiot.

But still, the original code here is wrong and your example code is 
correct.

regards,
dan carpenter


