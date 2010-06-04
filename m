From: walter harms <wharms@bfs.de>
Date: Fri, 04 Jun 2010 17:14:37 +0000
Subject: Re: [patch] V4L/DVB: dvb_ca_en50221: return -EFAULT on	copy_to_user
Message-Id: <4C09347D.9000007@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100604103629.GC5483@bicker>
In-Reply-To: <20100604103629.GC5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Dan Carpenter schrieb:
> On Fri, Jun 04, 2010 at 02:26:05PM +0200, walter harms wrote:
>> Doint to many things at once is bad. IMHO it is more readable to do so:
>>
>> +status = copy_to_user(buf, hdr, 2);
>> +if ( status  != 0) {
>>
>> Maybe the maintainer has different ideas but especialy lines like will gain.
>>
>> -if ((status = copy_from_user(fragbuf + 2, buf + fragpos, fraglen)) != 0)
>> +status = copy_from_user(fragbuf + 2, buf + fragpos, fraglen):
>> +if ( status  != 0) {
>>
>> just my 2 cents,
> 
> You're right of course as always and checkpatch warns about these as
> well.
> 
> I figured if it was in the original code, it was probably OK to leave it.
> But I now recognize this as pure laziness on my part and I appologize.  
> Twenty lashes for me and all that.  Fixed patch coming up.  ;)
> 
> regards,
> dan carpenter

I hope my guidance will ease your way to enlightenment.   ;)

re,
 wh
