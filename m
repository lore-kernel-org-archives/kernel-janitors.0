From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 21 Feb 2008 06:08:52 +0000
Subject: Re: [PATCH] fs: removing unused fops from struct char_device_struct
Message-Id: <47BD1574.9020705@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47BC9433.8020905@gmail.com> <20080221001535.GA23986@kroah.com>
In-Reply-To: <20080221001535.GA23986@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

oops, sorry... for some reason I though you were the guy :)
I'll resend

jirka


Greg KH wrote:
> On Wed, Feb 20, 2008 at 09:57:23PM +0100, Jiri Olsa wrote:
>> Hi,
>>
>> seems struct char_device_struct::fops is no longer used, removing it.
>> I checked with "make allyesconfig" and got proper compile.
>>
>> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
> 
> Hm, why send this to me?
> 
> Did I make the mistake of touching this file last?  Hm, nope, someone
> else touched it after I did, I'm safe :)
> 
> Seriously, I have no problem with this, but it should probably go
> through Andrew.
> 
> thanks,
> 
> greg k-h
> 

