From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 20 Aug 2011 14:17:53 +0000
Subject: Re: [patch -next] bcma: signedness bug in bcma_get_next_core()
Message-Id: <CACna6rw=Z_8ia=vaPN8CA4YJzh_nCet8B6biWaBo53wH1VZW+g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818133809.GG4786@shale.localdomain>
In-Reply-To: <20110818133809.GG4786@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

W dniu 20 sierpnia 2011 16:11 użytkownik walter harms <wharms@bfs.de> napisał:
>
>
> Am 20.08.2011 15:31, schrieb Rafał Miłecki:
>> W dniu 20 sierpnia 2011 14:59 użytkownik walter harms <wharms@bfs.de> napisał:
>>>
>>>
>>> Am 20.08.2011 14:23, schrieb Rafał Miłecki:
>>>> W dniu 18 sierpnia 2011 15:38 użytkownik Dan Carpenter
>>>> <error27@gmail.com> napisał:
>>>>> The u32 would never be less than zero so the error handling would
>>>>> break.  I changed it to int.
>>>>
>>>> In declaration we use s32:
>>>> static s32 bcma_erom_get_mst_port(struct bcma_bus *bus, u32 **eromptr);
>>>>
>>>> Doesn't it sound better to use s32 instead of int?
>>>>
>>>
>>> aktualy int sounds better that s32 for me.
>>
>> Will you care to replace function return type as well?
>>
>
> not me, i would have to download a decent kernel etc, just to change
> an s32 into int.

Ups, sorry, replied too fast without checking the person I ask for.

Dan: can you change the function as well?

-- 
Rafał
