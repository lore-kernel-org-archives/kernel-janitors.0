From: walter harms <wharms@bfs.de>
Date: Fri, 05 Mar 2010 09:44:37 +0000
Subject: Re: mysterious -1 offset in staging rt2860 driver
Message-Id: <4B90D285.6040404@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100304191403.GA24075@bicker>
In-Reply-To: <20100304191403.GA24075@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Dan Carpenter schrieb:
> So here is a mystery for people who enjoy such mysterious things.
> 
> drivers/staging/rt2860/sta_ioctl.c +1020 rt_ioctl_giwscan(219)
>   1011                  if (CAP_IS_PRIVACY_ON
>   1012                      (pAdapter->ScanTab.BssEntry[i].CapabilityInfo))
>   1013                          iwe.u.data.flags = IW_ENCODE_ENABLED | IW_ENCODE_NOKEY;
>   1014                  else
>   1015                          iwe.u.data.flags = IW_ENCODE_DISABLED;
>   1016
>   1017                  __smatch_value("iwe.u.data.flags");
>   1018                  previous_ev = current_ev;
>   1019                  current_ev >   1020                      iwe_stream_add_point(info, current_ev, end_buf, &iwe,
>   1021                                           (char *)pAdapter->
>   1022                                           SharedKey[BSS0][(iwe.u.data.
>   1023                                                            flags &
>   1024                                                            IW_ENCODE_INDEX) -
>   1025                                                           1].Key);
> 
> 
> That last bit is easier to read if it's on one line.
> 
> SharedKey[BSS0][(iwe.u.data.flags & IW_ENCODE_INDEX) - 1].Key);
> 
> iwe.u.data.flags is either 0x0400 or 0x8000.  IW_ENCODE_INDEX is 0xff, so
> after we mask off the lower bits we get 0x00 and then we subtract 1 we get
> an array offset of -1.
> 
> I doubt that's what we want, but what _do_ we want here?

I used http://tomoyo.sourceforge.jp/cgi-bin/lxr/ident?i=IW_ENCODE_INDEX to get an idea,
and it seems most times the index is protected by
if ( idx<0) what seems to indicate that the index should start with 1 (very wired).
NTL this is unreadable code and should be desected.
perhaps:

idx=iwe.u.data.flags & IW_ENCODE_INDEX) - 1
char *key=pAdapter->SharedKey[BSS0][idx].key

but i have  still no idea about this -1 it does not fit well.

just my 2 cents,
  walter

> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
