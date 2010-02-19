From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Feb 2010 10:10:47 +0000
Subject: Re: [patch] oxygen: clean up. make precedence explicit
Message-Id: <20100219101047.GB17130@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B7E4BD1.3040106@ladisch.de>
In-Reply-To: <4B7E4BD1.3040106@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Fri, Feb 19, 2010 at 09:29:05AM +0100, Clemens Ladisch wrote:
> > This doesn't change anything, but I think it makes the code clearer.
> > It silences a smatch warning:
> > sound/pci/oxygen/oxygen_mixer.c +91 dac_mute_put(7) warn: add some parenthesis here?
> 
> That message doesn't say why some parentheses should be added.
> And it's a question; how do I give it the answer "no"?  :-)
> 
> > -	changed = !value->value.integer.value[0] != chip->dac_mute;
> > +	changed = (!value->value.integer.value[0]) != chip->dac_mute;
> 
> This doesn't look any clearer to me; I don't think that the unary
> negation operator could be thought to have lower precedence than "!=".
> 

Well, it's hard to argue that it's more ambiguous.  :P

> Why does smatch warn about this combination?  Do such errors actually
> happen?
> 

Yep.  I have made some myself when writing smatch.

For example here are some related bugs in the current kernel.

drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
   721          if (!ext->ext_flags & IW_ENCODE_EXT_GROUP_KEY &&
   722              ext->alg != IW_ENCODE_ALG_WEP)
   723                  if (idx != 0 || ieee->iw_mode != IW_MODE_INFRA)
   724                          return -EINVAL;

                        if (!j->dsp.low != 0x20) {

drivers/telephony/ixj.c
  6834                          if (!j->dsp.low != 0x20) {

Mostly the real bugs have been fixed now.  Roel Kluin fixed quite a 
few of these before and I've fixed a couple.

regards,
dan carpenter

> 
> Regards,
> Clemens
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
